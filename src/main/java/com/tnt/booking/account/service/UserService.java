package com.tnt.booking.account.service;

import com.tnt.booking.account.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
