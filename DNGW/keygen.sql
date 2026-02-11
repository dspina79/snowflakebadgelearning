ALTER USER dspina79 SET RSA_PUBLIC_KEY='-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1yt2p8OTLzHWoKdsSg3C
fam8/Ecq78TN4+KTad5d9tvDI8NyFoGN2xW9PJVRPwgXn0dJxpR6l6SPynnwuDB5
uxOOnEKUba7REsFdD6AkanUytOuV9RRIX/BB9nnRBnWm78AbmRuPujz43S/+z1rL
gsnQ5ex2aCkapcp/vpkXKqQiO37EpExkXUVnaW4WiYHCYf3WC64HmNyIWU6Fi+0t
+q7RAytO1t89nHPlaF8w+hmSkqa19zYArsRpAW1x6/itDfSQBwMpkzLLs+fM9GMC
dB7C1mM4U1cLI/RUSDy90sXKC6A2xeJc1SLSU6PN5PR3CVb4muZUhSj2cJuBw4y6
dQIDAQAB
-----END PUBLIC KEY-----';


DESC USER dspina79
  ->> SELECT SUBSTR(
        (SELECT "value" FROM $1
           WHERE "property" = 'RSA_PUBLIC_KEY_FP'),
        LEN('SHA256:') + 1) AS key;










CREATE OR REPLACE API INTEGRATION my_git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/dspina79')
  ENABLED = TRUE;




  CREATE OR REPLACE API INTEGRATION my_git_api_integration
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/dspina79')
  ALLOWED_AUTHENTICATION_SECRETS = (util_db.public.my_git_secret)
  ENABLED = TRUE;