package com.yody.Server.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public abstract class AbstractDTO<T> {
    private Long id;
    private Timestamp createAt;
    private Timestamp updateAt;
}
