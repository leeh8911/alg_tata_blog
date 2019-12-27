clear, clc, close all;
figure_path = "./fig/usally_used_math_1_day";
mkdir(figure_path);

pntA = Point2D(1, 1);
pntB = Point2D(-1, -1);
pntC = Point2D(1, -1);
pntD = Point2D(-1, 1);
pntE = Point2D(1.5, 1.5);
pntF = Point2D(-1.5, 1.5);

line1 = Line2D(pntA, pntB);
line2 = Line2D(pntC, pntD);
line3 = Line2D(pntE, pntF);


figure; hold on; grid on; box on;
ax = gca;
axis([-2 2 -2 2]); axis equal;
line1.Draw(ax, 'r','o');
pntA.Text(ax, 'r', "A");
pntB.Text(ax, 'r', "B");
line2.Draw(ax, 'b','o');
pntC.Text(ax, 'b', "C");
pntD.Text(ax, 'b', "D");
line3.Draw(ax, 'g','o');
pntE.Text(ax, 'g', "E");
pntF.Text(ax, 'g', "F");
xlabel('\it{x}'); ylabel('\it{y}');
saveas(gcf, "./fig/usally_used_math_1_day/fig1.jpg")
