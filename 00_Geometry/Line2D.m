classdef Line2D
    properties(Access = public)
        start_pnt  Point2D
        end_pnt    Point2D
    end
    properties(Access = private)
        dir_vector
    end
    
    methods(Access = public)
        function obj = Line2D(pnt1, pnt2)
            obj.start_pnt = pnt1;
            obj.end_pnt = pnt2;
            
            obj.dir_vector = [obj.end_pnt.x - obj.start_pnt.x, obj.end_pnt.y - obj.start_pnt.y];
        end
        
        function obj = Draw(obj, ax, c, m)
            
            plot(ax, [obj.start_pnt.x obj.end_pnt.x], [obj.start_pnt.y obj.end_pnt.y], 'color', c, 'marker', m);
        end
    end
    
end