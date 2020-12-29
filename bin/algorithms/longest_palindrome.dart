String longestPalindrome(String s) {
  final len = s.length;
  /* 
    注意：这里勿使用filled静态方法创建List，Dart会使用同一个List实例填充
    final dp = List.filled(len, List.filled(len, false));
   */
  final dp = List.generate(len, (index) => List.filled(len, false));
  var ans = '';
  for (var l = 0; l < len; l++) {
    for (var i = 0; i < len - l; i++) {
      final j = i + l;
      if (l == 0) {
        dp[i][j] = true;
      } else if (l == 1) {
        dp[i][j] = s[i] == s[j];
      } else {
        dp[i][j] = (s[i] == s[j]) && dp[i + 1][j - 1];
      }
      if (dp[i][j] && l + 1 > ans.length) {
        ans = s.substring(i, i + l + 1);
      }
    }
  }
  return ans;
}

void main(List<String> args) {
  print(longestPalindrome('abababa'));
}
