%Part 3 – C
pkg load image
pkg load statistics
% Load the images
image1 = imread("C:\\Users\\sumag\\Downloads\\img1.png");
image2 = imread("C:\\Users\\sumag\\Downloads\\img2.png");

% Convert color images to grayscale
gray_image1 = rgb2gray(image1);
gray_image2 = imresize(gray_image2, size(gray_image1));

% Calculate the joint histogram
hist_2d = hist3([gray_image1(:), gray_image2(:)], [256, 256]);

% Normalize the histogram to get joint probabilities
joint_prob = hist_2d / sum(hist_2d(:));

% Calculate marginal probabilities for each image
marginal_prob1 = sum(joint_prob, 2);
marginal_prob2 = sum(joint_prob, 1);

% Compute mutual information
mutual_information = 0;
for i = 1:256
    for j = 1:256
        if joint_prob(i, j) > 0
            mutual_information = mutual_information + joint_prob(i, j) * log2(joint_prob(i, j) / (marginal_prob1(i) * marginal_prob2(j)));
        end
    end
end
