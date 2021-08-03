function  showpicture(A)
%SHOWPICTURE »­Í¼


alph=ones(200,200);
for ii=1:200
    for jj=1:200
        if (ii-100)^2+(jj-100)^2>10000
            
            alph(ii,jj)=0;
        end

    end
end
image(A,'CDataMapping','scaled','AlphaData',alph)
set(gca,'xtick',0:50:200);
set(gca,'ytick',0:50:200);
caxis([1,3.4])
colorbar
colormap jet
figure_FontSize=20;
set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
set(findobj('FontSize',10),'FontSize',figure_FontSize);

end

