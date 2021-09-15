/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   average.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: chbadad <chbadad@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/09/13 15:49:01 by chbadad           #+#    #+#             */
/*   Updated: 2021/09/15 13:38:51 by chbadad          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line.h"
#include <stdio.h>
int main(int ac, char **av)
{
	int fd;
	int ret;
	int count;
	char *line;

	count = 1;
	ret = 0;
	line = NULL;
	int res_3 = 0;
	int res_5 = 0;
	int res_100 = 0;
	int res_500 = 0;

	int av_3 = 0;
	int av_5 = 0;
	int av_100 = 0;
	int av_500 = 0;

	int max_3 = 0;
	int min_3 = 2147483647;

	int max_5 = 0;
	int min_5 = 2147483647;

	int max_100 = 0;
	int min_100 = 2147483647;

	int max_500 = 0;
	int min_500 = 2147483647;

	int nb = atoi(av[5]);

	int under_3 = 0;
	int over_3 = 0;

	int under_12 = 0;
	int over_12 = 0;

	int under_700 = 0;
	int under_900 = 0;
	int under_1100 = 0;
	int under_1300 = 0;
	int under_1500 = 0;
	int over_1500 = 0;

	int under_5500 = 0;
	int under_7000 = 0;
	int under_8500 = 0;
	int under_10000 = 0;
	int under_11500 = 0;
	int over_11500 = 0;

	(void)ac;
	fd = open(av[1], O_RDONLY);
	while ((ret = get_next_line(fd, &line)) > 0)
	{
		if (atoi(line) > max_3)
			max_3 = atoi(line);
		if (atoi(line) < min_3)
			min_3 = atoi(line);
		if (atoi(line) < 3)
			under_3++;
		if (atoi(line) > 3)
			over_3++;
		res_3 += atoi(line);
		free(line);
	}
	if (ret == 0)
	{
		res_3 += atoi(line);
		free(line);
	}
	close(fd);
	av_3 = res_3 / nb;

	nb = atoi(av[5]);
	fd = open(av[2], O_RDONLY);
	while ((ret = get_next_line(fd, &line)) > 0)
	{
		if (atoi(line) > max_5)
			max_5 = atoi(line);
		if (atoi(line) < min_5)
			min_5 = atoi(line);
		if (atoi(line) <= 12)
			under_12++;
		if (atoi(line) > 12)
			over_12++;
		res_5 += atoi(line);
		free(line);
	}
	if (ret == 0)
	{
		res_5 += atoi(line);
		free(line);
	}
	close(fd);
	av_5 = res_5 / nb;

	nb = atoi(av[5]);
	fd = open(av[3], O_RDONLY);
	while ((ret = get_next_line(fd, &line)) > 0)
	{
		if (atoi(line) > max_100)
			max_100 = atoi(line);
		if (atoi(line) < min_100)
			min_100 = atoi(line);
		if (atoi(line) >= 0 && atoi(line) < 700)
			under_700++;
		if (atoi(line) >= 700 && atoi(line) < 900)
			under_900++;
		if (atoi(line) >= 900 && atoi(line) < 1100)
			under_1100++;
		if (atoi(line) >= 1100 && atoi(line) < 1300)
			under_1300++;
		if (atoi(line) >= 1300 && atoi(line) < 1500)
			under_1500++;
		if (atoi(line) > 1500)
			over_1500++;
		res_100 += atoi(line);
		free(line);
	}
	if (ret == 0)
	{
		res_100 += atoi(line);
		free(line);
	}
	close(fd);
	av_100 = res_100 / nb;

	nb = atoi(av[5]);
	fd = open(av[4], O_RDONLY);
	while ((ret = get_next_line(fd, &line)) > 0)
	{
		if (atoi(line) > max_500)
			max_500 = atoi(line);
		if (atoi(line) < min_500)
			min_500 = atoi(line);
		if (atoi(line) >= 0 && atoi(line) < 5500)
			under_5500++;
		if (atoi(line) >= 5500 && atoi(line) < 7000)
			under_7000++;
		if (atoi(line) >= 7000 && atoi(line) < 8500)
			under_8500++;
		if (atoi(line) >= 8500 && atoi(line) < 10000)
			under_10000++;
		if (atoi(line) >= 10000 && atoi(line) < 11500)
			under_11500++;
		if (atoi(line) > 11500)
			over_11500++;
		res_500 += atoi(line);
		free(line);
	}
	if (ret == 0)
	{
		res_500 += atoi(line);
		free(line);
	}
	close(fd);
	av_500 = res_500 / nb;

	printf("\nRESULTS (3) :\nMIN = %d\nMAX = %d\nAVE = %d\nUNDER 3 : %d\nOVER 3 : %d\n", min_3, max_3, av_3, under_3, over_3);
	printf("\nRESULTS (5) :\nMIN = %d\nMAX = %d\nAVE = %d\nUNDER 12 : %d\nOVER 12 : %d\n", min_5, max_5, av_5, under_12, over_12);
	printf("\nRESULTS (100) :\nMIN = %d\nMAX = %d\nAVE = %d\nUNDER 700 : %d\nUNDER 900 : %d\nUNDER 1100 : %d\nUNDER 1300 : %d\nUNDER 1500 : %d\nOVER 1500 : %d\n", min_100, max_100, av_100, under_700, under_900, under_1100, under_1300, under_1500, over_1500);
	printf("\nRESULTS (500) :\nMIN = %d\nMAX = %d\nAVE = %d\nUNDER 5500 : %d\nUNDER 7000 : %d\nUNDER 8500 : %d\nUNDER 10000 : %d\nUNDER 11500 : %d\nOVER 11500 : %d\n", min_500, max_500, av_500, under_5500, under_7000, under_8500, under_10000, under_11500, over_11500);
	return (0);
}
