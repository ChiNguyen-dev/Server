package com.yody.Server.service.impl;

import com.yody.Server.api.admin.AdminFileUploadAPI;
import com.yody.Server.service.IStorageService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StreamUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class StorageServiceImpl implements IStorageService {

    public final Path storageFolder = Paths.get("uploads");

    public StorageServiceImpl() {
        try {
            Files.createDirectories(this.storageFolder);
        } catch (IOException exception) {
            throw new RuntimeException("Cannot initialize storage", exception);
        }
    }

    @Override
    public String storeFile(MultipartFile file) {
        try {
            if (file.isEmpty())
                throw new RuntimeException("Failed to storage empty file.");
            if (!isImageFile(file))
                throw new RuntimeException("You can only upload image file.");
            float fileSizeInMegaBytes = file.getSize() / 1_000_000.0f;
            if (fileSizeInMegaBytes > 5.0f)
                throw new RuntimeException("File must be <= 5MB.");

            String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
            String generatedFileName = UUID.randomUUID().toString().replace("-", "") + "." + fileExtension;

            Path destinationFilePath = storageFolder.resolve(Paths.get(generatedFileName))
                    .normalize().toAbsolutePath();
            if (!destinationFilePath.getParent().equals(storageFolder.toAbsolutePath()))
                throw new RuntimeException("Cannot store file outside current directory.");
            try (InputStream inputStream = file.getInputStream()) {
                Files.copy(inputStream, destinationFilePath, StandardCopyOption.REPLACE_EXISTING);
            }
            return MvcUriComponentsBuilder.fromMethodName(
                    AdminFileUploadAPI.class,
                    "readDetailFile",
                    generatedFileName
            ).build().toString();
        } catch (IOException exception) {
            throw new RuntimeException("Cannot initialize storage", exception);
        }
    }

    @Override
    public List<String> loadAll() {
        try {
            return Files.walk(this.storageFolder, 1)
                    .filter(path -> !path.equals(this.storageFolder) && !path.toString().contains("._"))
                    .map(this.storageFolder::relativize)
                    .map(path -> MvcUriComponentsBuilder
                            .fromMethodName(
                                    AdminFileUploadAPI.class,
                                    "readDetailFile",
                                    path.getFileName().toString())
                            .build()
                            .toUri()
                            .toString())
                    .collect(Collectors.toList());
        } catch (IOException exception) {
            throw new RuntimeException("Failed to load stored files.", exception);
        }
    }

    @Override
    public byte[] readFileContent(String name) {
        try {
            Path file = storageFolder.resolve(name);
            Resource resource = new UrlResource(file.toUri());
            if (resource.exists() || resource.isReadable()) {
                return StreamUtils.copyToByteArray(resource.getInputStream());
            } else {
                throw new RuntimeException("Could not read file: " + name);
            }
        } catch (IOException exception) {
            throw new RuntimeException("Could not read file: " + name, exception);
        }
    }

    @Override
    public void deleteAllFile() {

    }

    private boolean isImageFile(MultipartFile file) {
        String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
        return Arrays.asList(new String[]{"png", "jpg", "jpeg", "bmp"}).contains(fileExtension.trim().toLowerCase());
    }
}
