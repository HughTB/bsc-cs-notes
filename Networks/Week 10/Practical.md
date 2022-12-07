# Practical - 12:00 07/12/22

- To enter a periodic in Excel, you put ```=Cell+MinAmplitude/10``` e.g. ```=A2+0.007/10``` the first cell must be 0
- To enter the equation, you put ```=A*SIN(f*PI()*t)``` e.g. ```=10.5*SIN(100*PI()*A2)```
- Then when you limit the equation to the bandwidth, you remove any terms that have a frequency higher than the bandwidth
- To add in the attenuation, you multiply the entire equation by the previously calculated attenuation
- To add noise, we need to use the rand function. In this case, we want noise that varies from 2.5 to -2.5
    - To get this, we add ```+(RAND() * (max - min) + min)``` in this case, ```+(RAND() * (2.5 - -2.5) - 2.5)```