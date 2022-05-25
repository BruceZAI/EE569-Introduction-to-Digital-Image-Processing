function discriminantPowers = findDiscrimPower(features)
    discrimBlanketAvg = mean(features(1:9,:));
    discrimBrickAvg = mean(features(10:18,:));
    discrimGrassAvg = mean(features(19:27,:));
    discrimStonesAvg = mean(features(28:36,:));

    intraBlanket = sum((features(1:9,:)-discrimBlanketAvg).^2);
    intraBrick = sum((features(10:18,:)-discrimBrickAvg).^2);
    intraGrass = sum((features(19:27,:)-discrimGrassAvg).^2);
    intraStones = sum((features(28:36,:)-discrimStonesAvg).^2);

    intraVariety = intraBlanket+intraBrick+intraGrass+intraStones;

    globalAvg = mean(features);
    
    interVariety = (8*(discrimBlanketAvg-globalAvg).^2)+(8*(discrimBrickAvg-globalAvg).^2)+(8*(discrimGrassAvg-globalAvg).^2)+(8*(discrimStonesAvg-globalAvg).^2);

    discriminantPowers = intraVariety./interVariety;
end