//pragma solidity ^0.4.0;
    pragma experimental ABIEncoderV2;
    contract QuizApp
    {
     
        event Print(string _name, address _value);
        event Print1(string _name, uint _value);
        event Print2(address _name, uint _value);
        event Print3(string val);
        event Print4(uint val);
     
     
        //All set by organizer
        uint participation_fees = 0;
        address organizer_address;
        uint max_num_participant = 0;
        uint organizer_wallet = 0;
        uint current_cnt_of_participant = 0;
        
     
     
        mapping (address => uint) participant_map ;
        mapping (address => uint) regestered_participant ;
        
        uint [3][3] game_state;
        uint cnt_participant = 0;
        uint turn = 0;
        modifier not_organizer()
        {
            require ( msg.sender != organizer_address , " You are already regestered as an organizer ");
            _;
        }
        modifier not_already_regestered()
        {
            require(  regestered_participant[msg.sender] <=0 , " You are already regestered as a participant "  );
            _;
        }
        
        modifier number_of_participant()
        {
            require(  cnt_participant <=2 , " Not allowed "  );
            _;
        }
        
        constructor (  )
        {
            game_state[0][0]=0;game_state[0][1]=0;game_state[0][2]=0;
            game_state[1][0]=0;game_state[1][1]=0;game_state[1][2]=0;
            game_state[2][0]=0;game_state[2][1]=0;game_state[2][2]=0;
            cnt_participant = 0;   
        }
        function register_as_partricipant()
        not_already_regestered()
        {
            regestered_participant[msg.sender] = 1;
            cnt_participant += 1;
            participant_map[msg.sender ] = cnt_participant ;
        }
        
     
    }
    
    // 10,3,[1,2,3,4],[1,2,3,4]


