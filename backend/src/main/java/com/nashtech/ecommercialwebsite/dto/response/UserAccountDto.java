package com.nashtech.ecommercialwebsite.dto.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserAccountDto {

    @NotNull(message = "Enabled status is required")
    Boolean enabled;
    @NotNull(message = "Locked status is required")
    Boolean nonLocked;
    private Long id;
    @JsonProperty("email")
    private String userName;
    private String firstName;
    private String lastName;
    private String address;
    private String phone;

    // LoginStatusResponse loginStatus = new LoginStatusResponse();


}
