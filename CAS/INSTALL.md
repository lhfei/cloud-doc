

```
$ keytool.exe -genkey -alias ysas -keyalg RSA -keypass changeit -storepass changeit -keystore ysas.jks

您的名字与姓氏是什么?
  [Unknown]:  sas.jd.com
您的组织单位名称是什么?
  [Unknown]:  SAS
您的组织名称是什么?
  [Unknown]:  Com
您所在的城市或区域名称是什么?
  [Unknown]:  BJ
您所在的省/市/自治区名称是什么?
  [Unknown]:  BJ
该单位的双字母国家/地区代码是什么?
  [Unknown]:  CN
CN=sas.jd.com, OU=SAS, O=Com, L=BJ, ST=BJ, C=CN是否正确?
  [否]:  是
```

```
$ keytool.exe -exportcert -alias ysas -keystore ysas.jks -file ysas.cer -storepass changeit
```

```
$ keytool.exe -import -alias ysas -keystore ..\jre\lib\security\cacerts -file ysas.cer -storepass changeit
```

```
keytool.exe -list -v -keystore ..\jre\lib\security\cacerts -alias ysas

输入密钥库口令:
别名: ysas
创建日期: 2017-9-21
条目类型: trustedCertEntry

所有者: CN=sas.jd.com, OU=SAS, O=Com, L=BJ, ST=BJ, C=CN
发布者: CN=sas.jd.com, OU=SAS, O=Com, L=BJ, ST=BJ, C=CN
序列号: 4742ae04
有效期开始日期: Thu Sep 21 08:57:40 CST 2017, 截止日期: Wed Dec 20 08:57:40 CST 2017
证书指纹:
         MD5: B7:25:6C:5B:15:24:10:CB:EC:50:CF:72:AA:E6:EC:B6
         SHA1: 07:E1:9F:D0:89:2C:85:27:03:AC:5D:AF:B7:0D:84:15:69:F8:3A:51
         SHA256: E1:9A:F9:99:E7:D9:5F:A9:D8:93:79:30:B5:9E:E6:8B:25:D4:F2:67:FC:FC:AF:44:B4:13:C5:E2:7F:FE:15:CA
         签名算法名称: SHA256withRSA
         版本: 3

扩展:

#1: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: F2 E5 D6 A0 A5 8E 53 B0   5A 7F 04 53 B7 96 7A EE  ......S.Z..S..z.
0010: A5 97 91 5A                                        ...Z
]
```