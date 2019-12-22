classdef Point2D
    properties(Access = public)
        x;
        y;
    end
    methods(Access = public)
        function obj = Point2D(x, y)
            if(nargin == 0)
                obj.x = 0;
                obj.y = 0;
                warning("there is no initialize value!");
            else
                obj.x = x;
                obj.y = y;
            end
        end
        function obj = Draw(obj, ax, c, m)
            plot(ax, obj.x, obj.y, 'color', c, 'marker', m);
        end
        
    end
end