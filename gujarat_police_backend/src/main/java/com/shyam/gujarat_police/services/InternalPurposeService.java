package com.shyam.gujarat_police.services;

import com.shyam.gujarat_police.response.APIResponse;

public interface InternalPurposeService {
    APIResponse deleteAssignmentsInEntireEvent(Long eventId);
}
