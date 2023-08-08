package com.yody.Server.api.client;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.yody.Server.config.PaymentConfig;
import com.yody.Server.config.PaypalPaymentIntent;
import com.yody.Server.config.PaypalPaymentMethod;
import com.yody.Server.dto.order.PaymentInfo;
import com.yody.Server.dto.order.PaymentResDTO;
import com.yody.Server.dto.order.PlaceOrderRequest;
import com.yody.Server.dto.order.PlaceOrderResponse;
import com.yody.Server.service.IOrderService;
import com.yody.Server.utils.Utils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
@AllArgsConstructor
@RequestMapping("api/v1/auth/orders")
public class OrderController {
    public static final String URL_PAYPAL_SUCCESS = "pay/success";
    public static final String URL_PAYPAL_CANCEL = "pay/cancel";

    private Logger log = LoggerFactory.getLogger(getClass());
    @Autowired
    private IOrderService orderService;
    @PostMapping
    public PlaceOrderResponse placeOrder(@RequestBody PlaceOrderRequest orderDTO){
        return this.orderService.placeOrder(orderDTO);
    }

    @PostMapping("/pay")
    public ResponseEntity<String> pay(HttpServletRequest request, @RequestParam("price") double price ) {
        String cancelUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_CANCEL;
        String successUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_SUCCESS;
        try {
            Payment payment = orderService.createPayment(
                    price,
                    "USD",
                    PaypalPaymentMethod.paypal,
                    PaypalPaymentIntent.sale,
                    "payment description",
                    cancelUrl,
                    successUrl);
            for (Links links : payment.getLinks())
                if (links.getRel().equals("approval_url"))
                    return ResponseEntity.ok(links.getHref());

        } catch (PayPalRESTException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
        }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Payment initialization failed.");
    }

    @GetMapping(URL_PAYPAL_CANCEL)
    public ResponseEntity<String> cancelPay() {
        return ResponseEntity.ok("Payment canceled.");
    }

    @GetMapping(URL_PAYPAL_SUCCESS)
        public ResponseEntity<String> successPay (@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId){
        try {
            Payment payment = orderService.executePayment(paymentId, payerId);
            if (payment.getState().equals("approved"))
                return ResponseEntity.ok("Payment successful.");
        }
		 catch(PayPalRESTException e) {
             return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e.getMessage());
         }
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Payment approval failed.");
    }
//    @GetMapping("/create-payment")
//    public ResponseEntity<?> createPayment() throws UnsupportedEncodingException {
//
//        long amount = 1000000;
//        String vnp_TxnRef = PaymentConfig.getRandomNumber(8);
//        String vnp_TmnCode = PaymentConfig.vnp_TmnCode;
//        Map<String, String> vnp_Params = new HashMap<>();
//        vnp_Params.put("vnp_Version", PaymentConfig.vnp_Version);
//        vnp_Params.put("vnp_Command", PaymentConfig.vnp_Command);
//        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
//        vnp_Params.put("vnp_Amount", String.valueOf(amount));
//        vnp_Params.put("vnp_CurrCode", "VND");
//        vnp_Params.put("vnp_BankCode", "NCB");
//        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
//        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
////        vnp_Params.put("vnp_ReturnUrl", PaymentConfig.vnp_ReturnUrl);
//        vnp_Params.put("vnp_Locale", "vn");
//
//        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
//        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
//        String vnp_CreateDate = formatter.format(cld.getTime());
//        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
//
//        cld.add(Calendar.MINUTE, 15);
//        String vnp_ExpireDate = formatter.format(cld.getTime());
//        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
//
//        List fieldNames = new ArrayList(vnp_Params.keySet());
//        Collections.sort(fieldNames);
//        StringBuilder hashData = new StringBuilder();
//        StringBuilder query = new StringBuilder();
//        Iterator itr = fieldNames.iterator();
//        while (itr.hasNext()) {
//            String fieldName = (String) itr.next();
//            String fieldValue = (String) vnp_Params.get(fieldName);
//            if ((fieldValue != null) && (fieldValue.length() > 0)) {
//                //Build hash data
//                hashData.append(fieldName);
//                hashData.append('=');
//                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                //Build query
//                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
//                query.append('=');
//                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
//                if (itr.hasNext()) {
//                    query.append('&');
//                    hashData.append('&');
//                }
//            }
//        }
//        String queryUrl = query.toString();
//        String vnp_SecureHash = PaymentConfig.hmacSHA512(PaymentConfig.vnp_HashSecret, hashData.toString());
//        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
//        String paymentUrl = PaymentConfig.vnp_PayUrl + "?" + queryUrl;
//        PaymentResDTO paymentResDTO = new PaymentResDTO();
//        paymentResDTO.setStatus("OK");
//        paymentResDTO.setMessage("Successfully");
//        paymentResDTO.setURL(paymentUrl);
//        return ResponseEntity.ok().body(paymentResDTO);
//    }


}
