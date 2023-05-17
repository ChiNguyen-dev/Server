package com.yody.Server.service;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface IStorageService {
    String storeFile(MultipartFile file);

    List<String> loadAll();

    byte[] readFileContent(String fileName);

    boolean deleteFile(String fileName);
}
