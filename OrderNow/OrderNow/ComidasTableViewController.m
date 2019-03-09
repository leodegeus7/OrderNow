//
//  ComidasTableViewController.m
//  OrderNow
//
//  Created by Leonardo Geus on 07/04/15.
//  Copyright (c) 2015 Leonardo Geus. All rights reserved.
//

#import "ComidasTableViewController.h"
#import "CustomTableViewCell.h"
#import "DataManager.h"
#import "Item.h"

@interface ComidasTableViewController (){
    NSMutableArray *mydata;
    NSMutableArray *singlePedidos;

}

@end

@implementation ComidasTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UISwipeGestureRecognizer *swipeGestureRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRecognizer:)];
    swipeGestureRight.direction= UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:swipeGestureRight];
    
    UISwipeGestureRecognizer *swipeGestureLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRecognizer:)];
    swipeGestureLeft.direction= UISwipeGestureRecognizerDirectionLeft;
    [self.tableView addGestureRecognizer:swipeGestureLeft];
    
    singlePedidos=[[NSMutableArray alloc]init];
    
     mydata = [[DataManager getDataManager]dict][@"Comidas"];
 
    
    //Muda a cor da linha que separa as células
    self.tableView.separatorColor = [UIColor colorWithRed:0/255.0 green:140/255.0 blue:25/255.0 alpha:0.5];
    
}

-(void)viewWillAppear:(BOOL)animated{
    singlePedidos=[[DataManager getDataManager]dict][@"Pedidos"];
    if (singlePedidos.count==0) {
        singlePedidos=[[NSMutableArray alloc]init];
    }
    else{
        singlePedidos=[[DataManager getDataManager]dict][@"Pedidos"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)swipeRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    CustomTableViewCell *cell = [[CustomTableViewCell alloc]init];
    CGPoint location = [gestureRecognizer locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:location];
    
    cell  = [self.tableView cellForRowAtIndexPath:swipedIndexPath];

    if (gestureRecognizer.direction == UISwipeGestureRecognizerDirectionRight) {
        
//----- LAYOUT CÉLULA ATIVADA- muda o texto da label de instrução
        cell.backgroundColor = [UIColor colorWithRed:0/255.0 green:140/255.0 blue:25/255.0 alpha:0.2];
        cell.swipeComidaLabel.text = [NSString stringWithFormat:@"<- Swipe para remover da lista"];
        cell.swipeComidaLabel.textColor = [UIColor colorWithRed:180/255.0 green:0/255.0 blue:20/255.0 alpha:0.6];
        
        
        if (![singlePedidos containsObject:[mydata objectAtIndex:swipedIndexPath.row]]) {
            [singlePedidos addObject:[mydata objectAtIndex: swipedIndexPath.row]];
            [[[DataManager getDataManager]dict] setObject:singlePedidos forKey:@"Pedidos"];
        }
        
    }
    
    else {
        if ([singlePedidos containsObject:[mydata objectAtIndex:swipedIndexPath.row]]) {
            [singlePedidos removeObject:[mydata objectAtIndex: swipedIndexPath.row]];
            [[[DataManager getDataManager]dict] setObject:singlePedidos forKey:@"Pedidos"];
        }
        
//----- LAYOUT CÉLULA DESATIVADA - muda o fundo da célula e label de instrução
        cell.backgroundColor = [UIColor colorWithRed:15/255.0 green:170/255.0 blue:10/255.0 alpha:0.01];
        cell.swipeComidaLabel.text = [NSString stringWithFormat:@"Swipe para adicionar à lista ->"];
        cell.swipeComidaLabel.textColor = [UIColor colorWithRed:0/255.0 green:140/255.0 blue:25/255.0 alpha:0.6];

    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return mydata.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellcomida" forIndexPath:indexPath];
    
    cell.labelcell.text = [mydata[indexPath.row]nome];
    cell.imagecell.image = [UIImage imageNamed:[mydata[indexPath.row]img]];
    cell.textfieldcell.text = [mydata[indexPath.row]descricao];

//-- LAYOUT INICIAL DA CÉLULA
    cell.swipeComidaLabel.text = [NSString stringWithFormat:@"Swipe para adicionar à lista ->"];
    cell.swipeComidaLabel.textColor = [UIColor colorWithRed:0/255.0 green:140/255.0 blue:25/255.0 alpha:0.5];
    
    //Cor inicial do background das células
    cell.contentView.backgroundColor = [UIColor colorWithRed:15/255.0 green:170/255.0 blue:10/255.0 alpha:0.05];
    
    return cell;
}

//-(NSString *)lerarquivo : (NSString *)nomearquivo {
//    
//    NSString *enderecoArquivo = [[NSBundle mainBundle] pathForResource:nomearquivo ofType:@".txt"];
//    
//    NSString *conteudoArquivo = [NSString stringWithContentsOfFile:enderecoArquivo encoding:NSUTF8StringEncoding error:nil];
//    return conteudoArquivo;
//    
//}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//    
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        // Delete the row from the data source
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
//        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//    }   
//}

/*
//Métodos para dar espaço entre células
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return cellSpacingHeight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [UIView new];
    [v setBackgroundColor:[UIColor clearColor]];
    return v;
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
