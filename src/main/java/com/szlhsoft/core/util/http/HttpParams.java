package com.szlhsoft.core.util.http;

import java.util.ArrayList;
import java.util.List;

public class HttpParams {
	private List<Pair> pairs = new ArrayList<Pair>();

	public void add(String key, String value) {
		pairs.add(new Pair(key, value));
	}

	public void put(String key, String value) {
		pairs.add(new Pair(key, value));
	}

	public int size() {
		return pairs.size();
	}

	public List<Pair> getPairs() {
		return pairs;
	}

	public static class Pair {
		private String key;
		private String value;

		public String getKey() {
			return key;
		}

		public void setKey(String key) {
			this.key = key;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public Pair(String key, String value) {
			super();
			this.key = key;
			this.value = value;
		}

	}
}
