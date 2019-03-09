//
//  ConfirmarTableViewController.m
//  OrderNow
//
//  Created by Leonardo Geus on 07/04/15.
//  Copyright (c) 2015 Leonardo Geus. All rights reserved.
//

#import "ConfirmarTableViewController.h"
#import "DataManager.h"
#import "Item.h"
#import "PedidosTableViewCell.h"

@interface ConfirmarTableViewController (){
    NSMutableArray *myData;
}

@end

@implementation ConfirmarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRecognizer:)];
    swipeGestureRight.direction= UISwipeGestureRecognizerDirectionLeft;
    [self.tableView addGestureRecognizer:swipeGestureRight];

}
-(void)viewWillAppear:(BOOL)animated{
    myData = [[DataManager getDataManager]dict][@"Pedidos"];
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)swipeRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    PedidosTableViewCell *cell = [[PedidosTableViewCell alloc]init];
    CGPoint location = [gestureRecognizer locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:location];
    
    cell  = [self.tableView cellForRowAtIndexPath:swipedIndexPath];
    
    if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionLeft) {
        if ([myData containsObject:[myData objectAtIndex:swipedIndexPath.row]]) {
            [myData removeObject:[myData objectAtIndex: swipedIndexPath.row]];
            [[[DataManager getDataManager]dict] setObject:myData forKey:@"Pedidos"];
            [self.tableView reloadData];
        }
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
return myData.count;
    
}

-(NSString *)lerarquivo : (NSString *)nomearquivo {
    
    NSString *enderecoArquivo = [[NSBundle mainBundle] pathForResource:nomearquivo ofType:@".txt"];
    
    NSString *conteudoArquivo = [NSString stringWithContentsOfFile:enderecoArquivo encoding:NSUTF8StringEncoding error:nil];
    return conteudoArquivo;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PedidosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellpedidos" forIndexPath:indexPath];
    
    cell.labelNome.text = [myData[indexPath.row]nome];
    //cell.imagePedido.image = [UIImage imageNamed:[myData[indexPath.row]img]];
    //float preco = [[myData[indexPath.row]preco] floatValue];
    cell.labelPreco.text = [NSString stringWithFormat:@"R$%.2f",[[myData[indexPath.row]preco] floatValue]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//-- LAYOUT INICIAL DA CÉLULA
    cell.swipeConfirmarLabel.text = [NSString stringWithFormat:@"<- Swipe para remover da lista"];
    cell.swipeConfirmarLabel.textColor = [UIColor colorWithRed:180/255.0 green:0/255.0 blue:20/255.0 alpha:0.6];
    
    //Cor inicial do background das células
    cell.contentView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:30/255.0 alpha:0.1];
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    float soma=0;
    for (int i =0; i<myData.count; i++) {
        // [myData[i]preco float]
        soma+=[[myData[i]preco] floatValue];
    }
    
    
    CGRect frame = CGRectMake(0, 0, self.tableView.frame.size.width, 70);
    
    UIView *footer = [[UIView alloc]initWithFrame:frame];
    
    UILabel *tableFooter = [[UILabel alloc]init];
    //tableFooter.textColor = [UIColor blueColor];
    [tableFooter sizeToFit];
    
    
    tableFooter.opaque = YES;
    tableFooter.font = [UIFont boldSystemFontOfSize:15];
    tableFooter.text = [NSString stringWithFormat:@"Preço Total: R$%.2f",soma];
    [tableFooter sizeToFit];
    
    
    UIButton *confirmar = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [confirmar addTarget:self
                  action:@selector(actionConfirmar)
        forControlEvents:UIControlEventTouchUpInside];
    [confirmar setTitle:@"Confirmar" forState:UIControlStateNormal];
    confirmar.frame = CGRectMake(150.0, 0, 160.0, 20);
    [footer addSubview:tableFooter];
    [footer addSubview:confirmar];
    
    // self.tableView.tableFooterView = tableFooter;
    
    // self.tableView.tableFooterView = confirmar;
    
    
    
    return footer;
}

-(void)actionConfirmar{
    UIAlertController *alertController =[UIAlertController
                                         alertControllerWithTitle:@"Confirmar"
                                         message:@"Você tem certeza do seu pedido?"
                                         preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okaction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action) {
                                   //vai para storyboard TEMPO
                                   UIStoryboard *myStoryBoard = [UIStoryboard storyboardWithName:@"Storyboard2"
                                                                                          bundle:[NSBundle mainBundle]];
                                   UIViewController *myViewController = [myStoryBoard instantiateInitialViewController];
                                   [self.navigationController pushViewController:myViewController animated:YES];
                               }];
    
    UIAlertAction *cancelaction = [UIAlertAction
                                   actionWithTitle:@"Cancel"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action){
                                       [alertController dismissViewControllerAnimated:YES completion:nil];
                                   }];
    
    
    [alertController addAction:okaction];
    [alertController addAction:cancelaction];
    [self presentViewController:alertController animated:YES completion:nil];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
