module tic_tac_toe_game(
     input clock,
     input reset, 
     input play, //啟動玩家進行遊戲
     input pc, //啟動電腦進行遊戲
     input [3:0] computer_position,player_position,  // 電腦與玩家選擇的位置
     output wire [1:0] pos1,pos2,pos3,
     pos4,pos5,pos6,pos7,pos8,pos9, // 01: 玩家 // 10: 電腦
     output wire[1:0]who // 顯示勝利
     );
 wire [15:0] PC_en; 
 wire [15:0] PL_en; 
 wire illegal_move;
 wire win; 
 wire computer_play; 
 wire player_play;
 wire no_space;
 
 position_registers position_reg_unit(
      clock,
      reset,
      illegal_move, 
      PC_en[8:0], 
      PL_en[8:0], 
      pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9
      );
 
 // 檢測贏家
 winner_detector win_detect_unit(
      pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
      win, 
      who  
      );
 
 // 電腦位置解碼器
 position_decoder pd1(
      computer_position, 
      computer_play,     
      PC_en              
      );
 
 // 玩家位置解碼器
 position_decoder pd2(
      player_position,  
      player_play,    
      PL_en             
      ); 
 
 // 檢測非法移動
 illegal_move_detector imd_unit(
   pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
   PC_en[8:0], PL_en[8:0], 
   illegal_move           
   );
 
 // 檢測無空位
 nospace_detector nsd_unit(
   pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9, 
   no_space               
    ); 

 //FSM
 fsm_controller tic_tac_toe_controller(
     clock,      
     reset,     
     play,      
     pc,        
     illegal_move,
     no_space,   
     win,       
     computer_play, 
     player_play  
     );    
endmodule 

//存儲玩家或電腦的位置
module position_registers(
      input clock,       
      input reset,      
      input illegal_move,
      input [8:0] PC_en,
      input [8:0] PL_en, 
      output reg[1:0] pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9
      );
 
 // 棋盤1的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos1 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos1 <= pos1;
   else if(PC_en[0]==1'b1)
    pos1 <= 2'b10;
   else if (PL_en[0]==1'b1)
    pos1 <= 2'b01;
   else 
    pos1 <= pos1;
  end 
 end 

 //棋盤2的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos2 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos2 <= pos2; 
   else if(PC_en[1]==1'b1)
    pos2 <= 2'b10;
   else if (PL_en[1]==1'b1)
    pos2 <= 2'b01;
   else 
    pos2 <= pos2;
  end 
 end 
// 棋盤3的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos3 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos3 <= pos3;
   else if(PC_en[0]==1'b1)
    pos3 <= 2'b10;
   else if (PL_en[0]==1'b1)
    pos3 <= 2'b01;
   else 
    pos3 <= pos3;
  end 
 end 

 //棋盤4的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos4 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos4 <= pos4; 
   else if(PC_en[1]==1'b1)
    pos4 <= 2'b10;
   else if (PL_en[1]==1'b1)
    pos4 <= 2'b01;
   else 
    pos4 <= pos4;
  end 
 end 
// 棋盤5的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos5 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos5 <= pos5;
   else if(PC_en[0]==1'b1)
    pos5 <= 2'b10;
   else if (PL_en[0]==1'b1)
    pos5 <= 2'b01;
   else 
    pos5 <= pos5;
  end 
 end 
 //棋盤6的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos6 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos6 <= pos6; 
   else if(PC_en[1]==1'b1)
    pos6 <= 2'b10;
   else if (PL_en[1]==1'b1)
    pos6 <= 2'b01;
   else 
    pos6 <= pos6;
  end 
 end 
// 棋盤7的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos7 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos7 <= pos1;
   else if(PC_en[0]==1'b1)
    pos7 <= 2'b10;
   else if (PL_en[0]==1'b1)
    pos7 <= 2'b01;
   else 
    pos7 <= pos7;
  end 
 end 
 //棋盤8的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos8 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos8 <= pos8; 
   else if(PC_en[1]==1'b1)
    pos8 <= 2'b10;
   else if (PL_en[1]==1'b1)
    pos8 <= 2'b01;
   else 
    pos8 <= pos8;
  end 
 end 
 //棋盤9的位置
 always @(posedge clock or posedge reset)
 begin
  if(reset) 
   pos9 <= 2'b00; 
  else begin
   if(illegal_move==1'b1)
    pos9 <= pos9; 
   else if(PC_en[1]==1'b1)
    pos9 <= 2'b10;
   else if (PL_en[1]==1'b1)
    pos9 <= 2'b01;
   else 
    pos9 <= pos9;
  end
 end 



endmodule 


module fsm_controller(
     input clock,       
     input reset,        
     input play,     
     input pc,           
     input illegal_move, 
     input no_space,    
     input win,        
     output reg computer_play,
     output reg player_play   
     );
 
// 定義FSM的狀態
parameter IDLE=2'b00;       
parameter PLAYER=2'b01;     
parameter COMPUTER=2'b10;   
parameter GAME_DONE=2'b11; 

reg[1:0] current_state, next_state;

always @(posedge clock or posedge reset) 
begin 
 if(reset)
  current_state <= IDLE;
 else 
  current_state <= next_state;
end 
 
always @(*)
 begin
 case(current_state)
 IDLE: begin 
  if(reset==1'b0 && play == 1'b1)
   next_state <= PLAYER; 
  else 
   next_state <= IDLE;   
  player_play <= 1'b0;
  computer_play <= 1'b0;
 end 
 PLAYER:begin 
  player_play <= 1'b1;    
  computer_play <= 1'b0;
  if(illegal_move==1'b0)
   next_state <= COMPUTER; 
  else 
   next_state <= IDLE;    
 end 
 COMPUTER:begin 
  player_play <= 1'b0;
  if(pc==1'b0) begin 
   next_state <= COMPUTER;
   computer_play <= 1'b0;
  end
  else if(win==1'b0 && no_space == 1'b0)
  begin 
   next_state <= IDLE;  
   computer_play <= 1'b1; 
  end 
  else if(no_space == 1 || win ==1'b1)
  begin 
   next_state <= GAME_DONE; 
   computer_play <= 1'b1;
  end 
  else
   next_state <= IDLE;
 end
 GAME_DONE: begin 
  player_play <= 1'b0;    
  computer_play <= 1'b0; 
  next_state <= GAME_DONE;
 end
 default: next_state <= IDLE;
 endcase
 end 

endmodule 
