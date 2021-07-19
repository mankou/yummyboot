package yummy.boot.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import yummy.boot.mapper.TestMapper;
import yummy.boot.service.TestService;
import java.util.List;


@Service
@RequiredArgsConstructor
public class TestServiceImpl implements TestService {

    private final TestMapper testMapper;


    @Override
    public List testQueryDb() {
        List list=testMapper.queryDb();
        return list;
    }
}
