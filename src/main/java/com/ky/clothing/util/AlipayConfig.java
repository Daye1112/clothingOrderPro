package com.ky.clothing.util;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    /**
     * 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
     */
    public static String app_id = "2016100100639364";

    /**
     * 商户私钥，您的PKCS8格式RSA2私钥
     */
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC0taHHumD/reWxkgzN7vSfAIVo13ogs/rVd8cEk3BPOespipfrdRtIz0g2sF2QHwJMDgSP7jmhnpVzAVusgNjae6aDPIo5fGQVxpxZW2PvzBZllu9wC0gws8y987FDcjniGbIuTA+mDQqtdoRgunu2szV/ay3Oa8W2YsHXPB/FgN1K/Lm2TP6LBG0vGNqS/NFlEqZffweF0PtEiaDnpwBFpqBWG0ftfXirE5BoPE0//57gthK21EDRBZqepClrFkCyxy2lqI0WlNio972aJUJ1UFiYfdpcAUBKvDtP6n3mdf6/+1vlxLeu7EU4tUF7JjvWPNMGkJHpR9TdGWw/ZpdXAgMBAAECggEAF9ZhydvvEasZwou2fq/HuvWxo3vRE2FKdEBBk3vzc6/7Mlai5Z9kAv280+H95ZYBkpDCz02ocoZdxnbmZeH1ORTYiTVCMoUTGsBBPZRNoYM1bR805H3IfwwotOHhfzkhI48qLus/oTLVNr6Mhcnzqc0IAI/d0f3rbbynP0IiGsZEhGMUOUk4MZ78fNp7W/QQ1ip6BR4X4d3DzC3gUABVajjsztDr4e/5wzbc3o4prt9ByeGuDi0YYeTUqxzdqBBGBFzR1W+Hjm+hTtsIH/PEEj+AgoR5DrFR7Wae7GgfkJjgx5jLmkJij9kdPDDvJT9UmM7pY7ueakPCRMC/BMSC0QKBgQD6VstZ466ZPJ0jqn4p6XsvCdYvW7qFHxOImHsQBex5RZdsSejQngGNsNF0AvQ7B4XHwgACvvxwiFJmVGDsi5kvv4Hs3SOazwwLDRDIW+3M6IY/1IRN01TKmxOPrzM6a9MgJB9N+X71BMxnwDk1JlFuKF3mPgBR1C6IMq4ZkgfweQKBgQC4y8EQzkg9IHgalkETjhKX9J6f84HK3UJ6KmxN9g2jJS7ybxxiUcS22p0T+SpVSrgQ8vWsACjgRmnd+KoWu/SjmiRJ3eOHaLHiHbaZ8rzVSWdvYaluHfBm6vTakBKAIjrUaHcCulEMTc1kUR/iVeIao1BOKOwamLEMNrkIbGnyTwKBgQDvkDexoczoH7VQ+Esb2K9laEhrsaBg3EhZI3JA9ypBM3Og0WnWmh5qdZc7KciG5MAFVYWlGxeAqTQRcRX/x+ekZePzw/vaneCsgqhY1IBQ4wP1+W1S/LXb3WNu0P55Hc5Ap9C9UdFIsHrbnnwgfLbYcBDL0PGFXUPaWoV5OuIWIQKBgHc7WAVs42U1Ruj4m2Jvn4WV2qcfaVYn7pV+O8UNhf0Gp8TadfjmA0NryD+z22GOxTaCXIquy7DxHauPnsbuXMkWUmWqmfyrS2K2gzPPT5FaPDe8TqJzBMKSxIskvBsaetTD1k3XQyXqKSSZxzW07h770nurobMDY/CaekZ6FN23AoGABBpSRu+K7WXzYwKpCV2B81e1ZkJlmZX5rD36hP81CW23W+L4jZwhK2Nmr0P+OtCQHVBin7atVZA5nl78SQRwVvlyzHZ29WjcvHLkexH+lxzafrwvXAAG6AjpmaAzr8299yFTzcZzg11YagopXxQg4ZMNJ7r50luBsTpKiTFaKL4=";

    /**
     * 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
     */
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvmN6IlbGvORM0u2+mI/TNXMhT9c63SMkZiWZ5dvBrIHpFHYz8fhsiIx81cBXJT0dDK+rD8DcpouYhWG4iXB6RtnYDgJ6NIEqCl3KcI8vb/Dmo4Yqhop9pnaptzumj7Ulf0AeU3DiQPj57uXZupf6n23ydKWmg10j99Gq0AcofdWtHVyVzX85N4Z+c6ESk+G54T1qF4ub/4ev5asmcEhL22Jqhr+b1KpIEFiVzoS85glTe22cn/qKpOwhQTOKONsPj6QT650GkdaxsL8RzsPlmesHUPgEvZF6VkudpnfyCX9eCc20HynYvQFIPyVJfk/Pt/crbqhKKa4Stb75HJQcPwIDAQAB";

    /**
     * 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
     */
    public static String notify_url = "/userLink/order/list.html";

    /**
     * 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
     */
    public static String return_url = "/order/pay/over.do";

    /**
     * 签名方式
     */
    public static String sign_type = "RSA2";

    /**
     * 字符编码格式
     */
    public static String charset = "utf-8";

    /**
     * 支付宝网关
     */
    public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

}

