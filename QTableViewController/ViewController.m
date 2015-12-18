//
//  ViewController.m
//  QTableViewController
//
//  Created by qzp on 15/12/18.
//  Copyright © 2015年 qzp. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "QTableDataDelegate.h"
#import "UITableViewCell+Extension.h"
@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) QTableDataDelegate * tableHandler;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataSource = [NSMutableArray array];
    UserInfo * uf = [[UserInfo alloc] init];
    uf.name = @"王晓明";
    uf.info = @"我说往下";
    uf.photo = @"http://pics.sc.chinaz.com/files/pic/pic7/xpic140.jpg";
    
    UserInfo * uf2 = [[UserInfo alloc] init];
    uf2.name = @"bob";
    uf2.info = @"最近有个MVVM模式非常火热, 相信它的出现是为了模块化iOS开发, 其实在我看来,它始终还是MVC模式, 只是一个变种罢了 .(当然有人用到了响应式编程的思路颠覆了常规 , 但我们今天把讨论点集中于代码的设计模式) .";
    uf2.photo = @"http://cc.cocimg.com/api/uploads/20151217/1450343677258379.jpg";
    
    UserInfo * uf3 = [[UserInfo alloc] init];
    uf3.name = @"名字只能5个字";
    uf3.info = @"Here is an example of code in view controller (from another project) that is supposed to find a list of active priorities for a user";
    uf3.photo = @"http://pics.sc.chinaz.com/files/pic/pic9/201512/apic17214.jpg";
    
    UserInfo * uf4 = [[UserInfo alloc] init];
    uf4.name = @"欧阳邵阳";
    uf4.info = @"t version of our example\n换行";
    uf4.photo = @"http://pics.sc.chinaz.com/files/pic/pic9/201512/apic17140.jpg";
    
    UserInfo * uf5 = [[UserInfo alloc] init];
    uf5.name = @"";
    uf5.photo = @"http://pics.sc.chinaz.com/files/pic/pic9/201305/xpic11112.jpg";
    uf5.info = @"";
    
    
    [_dataSource addObject: uf];
    [_dataSource addObject: uf2];
    [_dataSource addObject: uf5];
    [_dataSource addObject: uf2];
    [_dataSource addObject: uf];
    [_dataSource addObject: uf3];
    [_dataSource addObject: uf4];

    
    
    
    _tableView = ({
        UITableView * tV = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStylePlain];
        [self.view addSubview: tV];
        tV;
    });
    
//    [self usual];
    [self setup];
    
}

- (void)  usual {
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 100;
    UINib * nib = [UINib nibWithNibName:@"MyCell" bundle:nil];
//    [UITableViewCell registerTable:self.tableView nibName:@"MyCell"];
    [_tableView registerNib: nib forCellReuseIdentifier:@"MyCell"];
}

-(void) setup {
  
    
    
    _tableHandler = ({

        QTableDataDelegate * tdd = [[QTableDataDelegate alloc] initWithItems: _dataSource cellIdentifier:@"MyCell"];
        tdd;
    });
    
//    _tableHandler.cellHeightBlock = ^CGFloat (NSIndexPath * indexPath, id item) {
//        return 44;
//    };

    _tableHandler.configureBlock =  ^ (NSIndexPath * indexPath, UserInfo  * item, UITableViewCell * cell) {
        [(MyCell *)cell setCell: item];
        
    };
    _tableHandler.didSelectBlock =^(NSIndexPath * indexPath, id item) {
        NSLog(@"%@-%@",indexPath,item);
    };


    
    //绑定数据源和代理
    [self.tableHandler handleTableViewDataSourceAndDelegate: self.tableView];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
