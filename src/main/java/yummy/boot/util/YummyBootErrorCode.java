package yummy.boot.util;

import com.skygroup.blue.web.ServiceExceptionCode;

public enum YummyBootErrorCode implements ServiceExceptionCode {
    notFoundSql("ErrorCode_0001","can not found sql by key"),
    helloEndError("ErrorCode_9999","hello error");

    YummyBootErrorCode(String code, String message){
        this.code = code;
        this.message = message;
    }

    private String code;
    private String message;


    @Override
    public String getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return message;
    }

}
