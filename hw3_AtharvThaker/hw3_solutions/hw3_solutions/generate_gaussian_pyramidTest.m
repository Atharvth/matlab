%% Empty image results in empty pyramid
gauss_pyramid = generate_gaussian_pyramid([]);
assert(isempty(gauss_pyramid));

%% Scalar results in one level pyramid
gauss_pyramid = generate_gaussian_pyramid(5);
assert(numel(gauss_pyramid) == 1);
assert(gauss_pyramid{1} == 5);

%% 256x256 image should produce 9-level pyramid
gauss_pyramid = generate_gaussian_pyramid(rand(256, 256));
assert(numel(gauss_pyramid) == 9);
expected_size = 256;
for i = 1:9
    assert(size(gauss_pyramid{i}, 1) == expected_size);
    assert(size(gauss_pyramid{i}, 2) == expected_size);
    expected_size = expected_size / 2;
end

%% 640x480 image should produce a 10-level pyramid
gauss_pyramid = generate_gaussian_pyramid(rand(480, 640));
assert(numel(gauss_pyramid) == 10);

%% 640x480 rgb image should produce a 10-level pyramid
gauss_pyramid = generate_gaussian_pyramid(rand(480, 640, 3));
assert(numel(gauss_pyramid) == 10);
assert(size(gauss_pyramid{1}, 3) == 1);
