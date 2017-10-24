function local_costmap_slider

    % Build the GUI
    init_ui;


    % This funciton sets up the figure and slider.
    % note the CreateFcn and the Callback.
    % The CreatFcn runs the first time while the Callback
    % runs each time you move the slider.
    function init_ui()
        f1 = figure;
        slider1 = uicontrol('Style', 'slider',...
                            'Min',0,'Max',20,'Value',log(252) / 1.4,...
                            'Position', [250 0 300 20],...
                            'CreateFcn', @solve_and_plot,...
                            'Callback',  @solve_and_plot); 
    end

    % This funciton it what is run when you first run the 
    % code and each time you move the slider.
    function solve_and_plot(src,event)
    
        % Get the current slider value
        sf = get(src,'Value');

%         csf = log(252);
csf = 5;
        r = 0.5;
        res = 15;
        [distance_from_obstacle, path_length] = meshgrid(0.5:(3*r-0.5)/res:3*r, 0.1:(3*r-0.1)/res:3*r);

l = (1-distance_from_obstacle)/0.5;
sf1 = log(252) / 1.4;
path_length_cost_Y = 252/8 * (3 + (1 + l.*exp(0.25*sf .* (path_length - 0.1))));

        obstacle_cost_X = exp(-1.0 * 5 * (distance_from_obstacle - r)) * 252;
        Z = 1*obstacle_cost_X + 1*path_length_cost_Y;
        s = surf(distance_from_obstacle, path_length, Z);
        xlabel('distance\_from\_obstacle');
        ylabel('path\_length'); ylim([0.1, inf]);
        zlabel('cost');
        colorbar;
%             view(2);
view(54,17);

    end

end