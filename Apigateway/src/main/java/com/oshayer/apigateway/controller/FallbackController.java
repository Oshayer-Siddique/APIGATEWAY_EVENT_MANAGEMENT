package com.oshayer.apigateway.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@RestController
public class FallbackController {

    // CircuitBreaker fallback
    @RequestMapping("/fallback")
    public Mono<ResponseEntity<Map<String, Object>>> fallback() {
        Map<String, Object> response = new HashMap<>();
        response.put("error", "Service Unavailable");
        response.put("message", "The event manager service is temporarily unavailable. Please try again later.");
        response.put("timestamp", LocalDateTime.now());
        response.put("status", HttpStatus.SERVICE_UNAVAILABLE.value());

        return Mono.just(ResponseEntity.status(HttpStatus.SERVICE_UNAVAILABLE).body(response));
    }

    // Optional: Custom RateLimiter error response (only if you wire it up manually)
    @RequestMapping("/rate-limit-fallback")
    public Mono<ResponseEntity<Map<String, Object>>> rateLimitFallback() {
        Map<String, Object> response = new HashMap<>();
        response.put("error", "Rate Limit Exceeded");
        response.put("message", "Too many requests. Please slow down and try again later.");
        response.put("timestamp", LocalDateTime.now());
        response.put("status", HttpStatus.TOO_MANY_REQUESTS.value());

        return Mono.just(ResponseEntity.status(HttpStatus.TOO_MANY_REQUESTS).body(response));
    }
}
