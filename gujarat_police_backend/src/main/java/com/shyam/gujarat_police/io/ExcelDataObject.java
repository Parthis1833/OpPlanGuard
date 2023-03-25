package com.shyam.gujarat_police.io;

import com.shyam.gujarat_police.util.CollectionUtil;

import java.util.ArrayList;
import java.util.List;

public class ExcelDataObject {

    private List<Long> userList;

    private List<String> errorList = new ArrayList<>(0);

    private int successCount = 0;

    private int failureCount = 0;


    public List<Long> getUserList() {
        return userList;
    }

    public void setUserList(List<Long> users) {
        if (users == null) {
            return;
        }
        if (CollectionUtil.nullOrEmpty(this.userList)) {
            this.userList = users;
        } else {
            userList.addAll(users);
        }
    }

    public List<String> getErrorList() {
        return errorList;
    }

    public void setErrorList(List<String> errors) {
        if (errors == null) {
            return;
        }
        if (CollectionUtil.nullOrEmpty(this.errorList)) {
            this.errorList = errors;
        } else {
            errorList.addAll(errors);
        }

    }

    public int getSuccessCount() {
        return successCount;
    }

    public void setSuccessCount(int successCount) {
        this.successCount = successCount;
    }

    public int getFailureCount() {
        return failureCount;
    }

    public void setFailureCount(int failureCount) {
        this.failureCount = failureCount;
    }

    public void incrementFailureCount() {
        this.failureCount += 1;
    }

    public void incrementSuccessCount() {
        this.successCount += 1;
    }
}
