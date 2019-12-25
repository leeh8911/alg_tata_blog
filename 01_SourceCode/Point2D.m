classdef Point2D
    properties(Access = public)
        x;
        y;
    end
    properties(Access = private)
        dist;
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
        
        function val = DistToTarget(obj, target)
            if(isnan(obj.dist))
            obj.dist = norm([obj.x - target.x, obj.y - target.y],2);
            end
            val = obj.dist;
            return;
        end
        
        function val = PrintDist(obj, target, ax, c, m)
            if(isnan(obj.dist))
            obj = obj.DistToTarget(target);
            end
            val = obj.dist;
            text(ax, sum([obj.x, target.x])/2, sum([obj.x, target.x])/2, sprintf("distance : %f", val), 'color',c);
            plot(ax, [obj.x, target.x], [obj.y, target.y], 'color', c, 'marker', m);
        end
    end
end