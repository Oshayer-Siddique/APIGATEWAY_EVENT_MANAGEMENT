package com.oshayer.apigateway.config;

import org.springframework.boot.web.reactive.error.ErrorWebExceptionHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

@Configuration
public class ErrorConfig {

    @Bean
    @Order(-1)
    public ErrorWebExceptionHandler errorWebExceptionHandler() {
        return new ErrorWebExceptionHandler() {
            @Override
            public Mono<Void> handle(ServerWebExchange exchange, Throwable ex) {
                exchange.getResponse().setStatusCode(HttpStatus.INTERNAL_SERVER_ERROR);
                exchange.getResponse().getHeaders().add("Content-Type", MediaType.APPLICATION_JSON_VALUE);

                String errorResponse = "{\"error\":\"Internal Server Error\",\"message\":\"" +
                        ex.getMessage() + "\",\"timestamp\":\"" +
                        java.time.LocalDateTime.now() + "\"}";

                var buffer = exchange.getResponse().bufferFactory().wrap(errorResponse.getBytes());
                return exchange.getResponse().writeWith(Mono.just(buffer));
            }
        };
    }
}