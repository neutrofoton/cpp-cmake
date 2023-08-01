// https://docs.opencv.org/master/db/deb/tutorial_display_image.html

#include <iostream>

#include <opencv2/opencv.hpp>
#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/highgui.hpp>

using namespace std;
using namespace cv;

int main(){

    std::string image_path = "../spiderman.jpeg";
    Mat img = imread(image_path, IMREAD_COLOR);
    if(img.empty())
    {
        std::cout << "Could not read the image: " << image_path << std::endl;
        return 1;
    }

    namedWindow("Display Image", WINDOW_AUTOSIZE);
    imshow("Display window", img);
    int k = waitKey(0); // Wait for a keystroke in the window
    if(k == 's')
    {
        //imwrite("starry_night.png", img);
    }
    
    return 0;
}