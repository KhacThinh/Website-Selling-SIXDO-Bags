package com.bags.sixdoBag.model.user;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailEntity {
    private String to;
    private String subject;
    private String content;
    private Map<String,Object> props;
}
