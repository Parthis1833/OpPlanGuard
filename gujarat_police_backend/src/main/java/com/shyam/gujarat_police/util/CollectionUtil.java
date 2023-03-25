package com.shyam.gujarat_police.util;

import java.util.*;
import java.util.stream.IntStream;
import java.util.stream.Stream;


public class CollectionUtil {

	/**
	 * http://stackoverflow.com/questions/12026885/common-util-to-break-a-list-into-batch
	 * Stream list in batches.
	 * 
	 * @author santosh
	 * @param source
	 * @param length
	 * @return
	 */
	public static <T> Stream<List<T>> batches(List<T> source, int length) {
		int size = source.size();
		if (length < 0) {
			throw new IllegalArgumentException("length = " + length);
		} else if (length == 0 && size != 0) {
			return Stream.of(source);
		}
		if (size <= 0) {
			return Stream.empty();
		}
		int fullChunks = (size - 1) / length;
		return IntStream
			.range(0, fullChunks + 1)
			.mapToObj(n -> source.subList(n * length, n == fullChunks ? size : (n + 1) * length));
	}

	/**
	 * Check given collection is not null and not empty.
	 * 
	 * @author vicky.thakor
	 * @since 2017-01-09
	 * @param collection
	 * @return
	 */
	public static boolean nonNullNonEmpty(Collection<?> collection) {
		return Objects.nonNull(collection) && !collection.isEmpty();
	}

	/**
	 * Check given map is not null and not empty.
	 * 
	 * @author vicky.thakor
	 * @since 2017-03-21
	 * @param map
	 * @return
	 */
	public static boolean nonNullNonEmptyMap(Map<?, ?> map) {
		return Objects.nonNull(map) && !map.isEmpty();
	}

	/**
	 * Check given collection is null or empty.
	 * 
	 * @author vicky.thakor
	 * @since 2017-06-14
	 * 
	 * @param collection
	 * @return
	 */
	public static boolean nullOrEmpty(Collection<?> collection) {
		return Objects.isNull(collection) || collection.isEmpty();
	}

	/**
	 * returns random number between range.
	 */
	public static int random(int min, int max) {
		return new Random().nextInt(max - min + 1) + min;
	}

	/**
	 * pick randomly one from list
	 */
	public static <R> R pickRandom(List<R> list) {
		return list.get(random(0, list.size() - 1));
	}

	public static <E> Collection<E> makeCollection(Iterable<E> iter) {
		Collection<E> list = new ArrayList<E>();
		for (E item : iter) {
			list.add(item);
		}
		return list;
	}
}
