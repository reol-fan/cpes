package com.atguigu.crowdfunding.utils;

import java.util.Random;

public class NumberUtil {

	public static String getRandomNum(int i) {
		String str = "abcdefghijklmnopqrstuvwxyz123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		int length = str.length();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int j = 0; j < i; j++) {
			sb.append(str.charAt(random.nextInt(length)));
		}
		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(getRandomNum(6));
	}
}
