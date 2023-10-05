module mod3_counter(
    input clk,
    input start,
    input stop,
    input data,
    output result
    );
    
    reg valid = 0;
    reg [1:0] modulo = 0;
    reg [1:0] next_modulo = 0;
    reg result_reg = 0;
    
    // Флаг, определяющий время получения данных
    always @(posedge clk) 
    begin
        if (start == 1 & valid == 0)
            valid <= 1;
        if (stop == 1 & valid == 1)
            valid <= 0;
    end
    
    // Вычисление остатка от деления на 3
    always @(posedge clk)
    begin
        modulo <= next_modulo;
    end
    
    always @(*)
    begin
        if (valid | start)
        begin
            case (modulo)
                0:
                    next_modulo = (data == 1) ? 1 : 0;
                1:
                    next_modulo = (data == 1) ? 0 : 2;
                2:
                    next_modulo = (data == 1) ? 2 : 1;
                default:
                    next_modulo = 0;
            endcase
        end
    end

    // Получение ответа
    always @(posedge clk)
    begin
    	result_reg <= (stop == 1 & next_modulo == 0) ? 1 : 0;
    end

    assign result = result_reg;
    
endmodule
