

## Crreate Token

Let’s get the tokens. First add an authorization header with client credentials [**my-trusted-client**/**secret**].

```
http://localhost:8080/SpringSecurityOAuth2Example/oauth/token?grant_type=password&username=bill&password=abc123
```

<image src="images/create_token.png" />

<hr />

## Validation

Save these tokens somewhere, you will need them. Now you can use this access-token [valid for 2 minutes] to access resources.

<image src="images/users.png" />

<hr />

## Token Expired

<image src="images/token_expired.png" />




#### Refrence 
> [Secure Spring REST API using OAuth2](http://websystique.com/spring-security/secure-spring-rest-api-using-oauth2/)


>[Spring Rest service security with OAUTH – XML](http://javainsimpleway.com/spring-rest-service-security-with-oauth-xml/)


> [Expression-Based Authorization with Spring Security 3](https://dzone.com/refcardz/expression-based-authorization)




