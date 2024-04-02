package com.bags.sixdoBag.config;

import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashSet;
import java.util.Set;

public class PasswordResetUtil {

    private static final SecureRandom secureRandom = new SecureRandom();
    private static final Set<String> generatedTokens = new HashSet<>();

    public static synchronized String generateUniqueToken() {
        String token;
        do {
            token = generateRandomToken();
        } while (!generatedTokens.add(token)); // Thêm token vào danh sách và kiểm tra xem có bị trùng lặp không
        return token;
    }

    private static String generateRandomToken() {
        byte[] bytes = new byte[16];
        secureRandom.nextBytes(bytes);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(bytes);
    }
}

