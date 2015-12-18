# QTableViewController
**表格瘦身**

_tableHandler = ({
      QTableDataDelegate * tdd = [[QTableDataDelegate alloc] initWithItems: _dataSource cellIdentifier:@"MyCell"];
        tdd;
    });
    //需要自定义高度时实现
//    _tableHandler.cellHeightBlock = ^CGFloat (NSIndexPath * indexPath, id item) {
//        return 44;
//    };

//配置样式
    _tableHandler.configureBlock =  ^ (NSIndexPath * indexPath, UserInfo  * item, UITableViewCell * cell) {
        [(MyCell *)cell setCell: item];
        
    };
    //点击回调
    _tableHandler.didSelectBlock =^(NSIndexPath * indexPath, id item) {
        NSLog(@"%@-%@",indexPath,item);
    };

    //绑定数据源和代理
    [self.tableHandler handleTableViewDataSourceAndDelegate: self.tableView];
    
    #------------
    
    
    
    ![image](https://github.com/914813666/QTableViewController/blob/master/infoImg/Simulator%20Screen%20Shot%202015%E5%B9%B412%E6%9C%8818%E6%97%A5%20%E4%B8%8B%E5%8D%882.22.03.png)
    
