package com.yody.Server.api.admin;

import com.yody.Server.service.IStorageService;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;

@RestController
@AllArgsConstructor
@RequestMapping("/api/v1/admin/FileUpload")
public class AdminFileUploadAPI {
    private IStorageService storageService;

    @GetMapping
    public ResponseEntity<List<String>> getUploadedFiles() {
        try {
            List<String> data = this.storageService.loadAll();
            return ResponseEntity.ok(data);
        } catch (Exception exception) {
            return ResponseEntity.noContent().build();
        }
    }

    @GetMapping("/{fileName:.+}")
    public ResponseEntity<byte[]> readDetailFile(@PathVariable String fileName) {
        try {
            byte[] bytes = this.storageService.readFileContent(fileName);
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(bytes);
        } catch (Exception exception) {
            return ResponseEntity.noContent().build();
        }
    }

    @PostMapping
    public ResponseEntity<?> upload(@RequestParam("files") MultipartFile[] files) {
        try {
            List<String> images = new ArrayList<>();
            for (MultipartFile file : files) images.add(this.storageService.storeFile(file));
            return ResponseEntity.status(HttpStatus.OK).body(images);
        } catch (Exception exception) {
            return ResponseEntity.status(HttpStatus.OK).body("Upload file failed");
        }
    }

}
