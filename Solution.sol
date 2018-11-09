//pragma solidity ^0.4.0;
    pragma experimental ABIEncoderV2;
    contract QuizApp
    {
     
        event Print(string _name, address _value);
        event Print1(string _name, uint _value);
        event Print2(address _name, uint _value);
        event Print3(string val);
        event Print4(uint val);
     
     
        
     
        mapping (address => uint) participant_map ; // for turn 
        mapping (address => uint) regestered_participant ;// check already regestired
        
        uint [3][3] game_state;
        uint cnt_participant = 0;
        uint turn = 0;
        uint winner = 0;
        uint game_over = 0;
        address organizer_address;
        modifier not_already_regestered()
        {
            require(  regestered_participant[msg.sender] <=0 , " You are already regestered as a participant "  );
            _;
        }
        
        
        modifier not_organizer()
        {
            require(  msg.sender !=organizer_address , " You are already regestered as a organizer "  );
            _;
        }
        modifier number_of_participant()
        {
            require(  cnt_participant <=2 , " Not allowed "  );
            _;
        }
        modifier check_turn()
        {
            require(  participant_map[msg.sender]==turn, " Not allowed "  );
            _;
        }
        
        modifier check_valid_input(uint x , uint y)
        {
            require(  game_state[x][y]==0, " Invalid Input 11 "  );
            _;
        }
        modifier check_valid_xy(uint x , uint y)
        {
            require(  x>=0 && x<=2 && y>=0 && y<=2 , " Invalid Input 22"  );
            _;
        }
        modifier check_winner()
        {
            require( game_over==0 , "Match Over");_;
            
            
        }
        
        constructor (  )
        {
            game_state[0][0]=0;game_state[0][1]=0;game_state[0][2]=0;
            game_state[1][0]=0;game_state[1][1]=0;game_state[1][2]=0;
            game_state[2][0]=0;game_state[2][1]=0;game_state[2][2]=0;
            cnt_participant = 0; 
            turn = 1;
            organizer_address = msg.sender;
        }
        
        function register_as_partricipant()
        not_already_regestered()
        not_organizer
        {
            regestered_participant[msg.sender] = 1;
            cnt_participant += 1;
            participant_map[msg.sender ] = cnt_participant ;
        }
        
        function play_game( uint x , uint y)
        check_turn()
        check_valid_input(x, y)
        check_valid_xy(x,y)
        check_winner()
        not_organizer()
        {
            game_state[x][y] = turn;

            if(game_state[0][0]==turn && game_state[0][1]==turn && game_state[0][2]==turn  )
            {
                winner = turn;game_over = 1;
            }
            if(game_state[1][0]==turn && game_state[1][1]==turn && game_state[1][2]==turn )
            {
                winner = turn;game_over = 1;
            }
            if(game_state[2][0]==turn && game_state[2][1]==turn && game_state[2][2]==turn )
            {
                winner = turn;game_over = 1;
            }

            // diagonal            
            if(game_state[0][0]==turn && game_state[1][1]==turn && game_state[2][2]==turn )
            {
                winner = turn;game_over = 1;
            }
            if(game_state[0][2]==turn && game_state[1][1]==turn && game_state[2][0]==turn )
            {
                winner = turn;game_over = 1;
            }
            
            //column
            if(game_state[0][0]==turn && game_state[1][0]==turn && game_state[2][0]==turn  )
            {
                winner = turn;game_over = 1;
            }
            if(game_state[0][1]==turn && game_state[1][1]==turn && game_state[2][1]==turn )
            {
                winner = turn;game_over = 1;
            }
            if(game_state[0][2]==turn && game_state[1][2]==turn && game_state[2][2]==turn )
            {
                winner = turn;game_over = 1;
            }

            if(winner>0)
            {
                Print2(msg.sender , turn);
                if(winner==1)
                {
                    Print3("winner1");
                }
                if(winner==2)
                {
                    Print3("winner2");
                }
            }
            
            
            if(turn==1)
            {
                turn += 1;
            }
            else
            {
                turn -=1;
            }
        }
        
     
    }
    
    // 10,3,[1,2,3,4],[1,2,3,4]


