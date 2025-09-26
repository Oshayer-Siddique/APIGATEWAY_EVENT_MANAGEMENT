package com.oshayer.apigateway.config;

import org.springframework.cloud.gateway.filter.ratelimit.KeyResolver;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import reactor.core.publisher.Mono;

@Configuration
public class GatewayConfig {

    @Bean
    public KeyResolver userKeyResolver() {
        // Rate limit by IP address
        return exchange -> Mono.just(exchange.getRequest().getRemoteAddress().getAddress().getHostAddress());
    }

    // Alternative: Rate limit by user (if you have authentication)
    // @Bean
    // public KeyResolver userKeyResolver() {
    //     return exchange -> exchange.getPrincipal()
    //             .cast(JwtAuthenticationToken.class)
    //             .map(JwtAuthenticationToken::getToken)
    //             .map(jwt -> jwt.getClaimAsString("sub"))
    //             .switchIfEmpty(Mono.just("anonymous"));
    // }
}