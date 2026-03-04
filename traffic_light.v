module traffic_light(
    input clk,
    input reset,
    output reg highway_g,
    output reg highway_y,
    output reg highway_r,
    output reg side_g,
    output reg side_r
);

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10;

reg [1:0] current_state, next_state;
reg [3:0] counter;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        current_state <= S0;
        counter <= 0;
    end
    else
    begin
        if(counter == 9)
        begin
            current_state <= next_state;
            counter <= 0;
        end
        else
        begin
            counter <= counter + 1;
        end
    end
end

always @(*)
begin
    case(current_state)
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S0;
        default: next_state = S0;
    endcase
end

always @(*)
begin
    highway_g = 0;
    highway_y = 0;
    highway_r = 0;
    side_g = 0;
    side_r = 0;

    case(current_state)

        S0:
        begin
            highway_g = 1;
            side_r = 1;
        end

        S1:
        begin
            highway_y = 1;
            side_r = 1;
        end

        S2:
        begin
            highway_r = 1;
            side_g = 1;
        end

    endcase
end

endmodule
