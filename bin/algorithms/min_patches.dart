int minPatches(List<int> nums, int n) {
  var patches = 0;
  var x = 1;
  var index = 0;
  final len = nums.length;

  while (x <= n) {
    if (index < len && nums[index] <= x) {
      x += nums[index];
      index++;
    } else {
      x *= 2;
      patches++;
    }
  }

  return patches;
}

void main(List<String> args) {
  print(minPatches([1, 3], 6));
  print(minPatches([1, 5, 10], 20));
  print(minPatches([1, 2, 2], 5));
}
