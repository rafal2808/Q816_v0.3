/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/ja/Desktop/work/FPGA/projekty/ALU/CORE_M2.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2323084722_3212880686_p_0(char *t0)
{
    char *t1;
    int t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1152U);
    t2 = (3 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t6 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 4U, t5);
    if (t6 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1192U);
    t7 = *((char **)t1);
    t2 = (7 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t13 = (t6 == (unsigned char)3);
    if (t13 != 0)
        goto LAB8;

LAB10:
LAB9:    t1 = (t0 + 4376);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(55, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t9 = (7 - 7);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t7 = (t8 + t12);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(56, ng0);
    t15 = (t0 + 1032U);
    t16 = *((char **)t15);
    t15 = (t0 + 4504);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t16, 8U);
    xsi_driver_first_trans_fast(t15);
    goto LAB6;

LAB8:    xsi_set_current_line(60, ng0);
    t8 = (t0 + 7218);
    t16 = (t0 + 4504);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t8, 8U);
    xsi_driver_first_trans_fast(t16);
    goto LAB9;

}

static void work_a_2323084722_3212880686_p_1(char *t0)
{
    char *t1;
    int t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1152U);
    t2 = (2 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t6 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 5U, t5);
    if (t6 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 1192U);
    t7 = *((char **)t1);
    t2 = (6 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t13 = (t6 == (unsigned char)3);
    if (t13 != 0)
        goto LAB8;

LAB10:
LAB9:    t1 = (t0 + 4392);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(69, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t9 = (6 - 7);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t7 = (t8 + t12);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(70, ng0);
    t15 = (t0 + 1672U);
    t16 = *((char **)t15);
    t15 = (t0 + 4568);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t16, 8U);
    xsi_driver_first_trans_fast(t15);
    goto LAB6;

LAB8:    xsi_set_current_line(74, ng0);
    t8 = (t0 + 7226);
    t16 = (t0 + 4568);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t8, 8U);
    xsi_driver_first_trans_fast(t16);
    goto LAB9;

}

static void work_a_2323084722_3212880686_p_2(char *t0)
{
    char *t1;
    int t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1152U);
    t2 = (1 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t6 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 6U, t5);
    if (t6 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(92, ng0);
    t1 = (t0 + 1192U);
    t7 = *((char **)t1);
    t2 = (5 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t13 = (t6 == (unsigned char)3);
    if (t13 != 0)
        goto LAB8;

LAB10:
LAB9:    t1 = (t0 + 4408);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(83, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t9 = (5 - 7);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t7 = (t8 + t12);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(84, ng0);
    t15 = (t0 + 1672U);
    t16 = *((char **)t15);
    t17 = (0 - 7);
    t18 = (t17 * -1);
    t19 = (1U * t18);
    t20 = (0 + t19);
    t15 = (t16 + t20);
    t21 = *((unsigned char *)t15);
    t22 = (t0 + 4632);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    *((unsigned char *)t26) = t21;
    xsi_driver_first_trans_delta(t22, 5U, 1, 0LL);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 1672U);
    t7 = *((char **)t1);
    t2 = (1 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t8 = (t0 + 4632);
    t15 = (t8 + 56U);
    t16 = *((char **)t15);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t6;
    xsi_driver_first_trans_delta(t8, 4U, 1, 0LL);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 1672U);
    t7 = *((char **)t1);
    t2 = (2 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t8 = (t0 + 4632);
    t15 = (t8 + 56U);
    t16 = *((char **)t15);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t6;
    xsi_driver_first_trans_delta(t8, 3U, 1, 0LL);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 1672U);
    t7 = *((char **)t1);
    t2 = (3 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t8 = (t0 + 4632);
    t15 = (t8 + 56U);
    t16 = *((char **)t15);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t6;
    xsi_driver_first_trans_delta(t8, 2U, 1, 0LL);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 1672U);
    t7 = *((char **)t1);
    t2 = (4 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t8 = (t0 + 4632);
    t15 = (t8 + 56U);
    t16 = *((char **)t15);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t6;
    xsi_driver_first_trans_delta(t8, 1U, 1, 0LL);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1672U);
    t7 = *((char **)t1);
    t2 = (5 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t8 = (t0 + 4632);
    t15 = (t8 + 56U);
    t16 = *((char **)t15);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t6;
    xsi_driver_first_trans_delta(t8, 0U, 1, 0LL);
    goto LAB6;

LAB8:    xsi_set_current_line(93, ng0);
    t8 = (t0 + 7234);
    t16 = (t0 + 4632);
    t22 = (t16 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t8, 6U);
    xsi_driver_first_trans_fast(t16);
    goto LAB9;

}

static void work_a_2323084722_3212880686_p_3(char *t0)
{
    char *t1;
    int t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned char t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 1152U);
    t2 = (0 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t6 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 7U, t5);
    if (t6 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(106, ng0);
    t1 = (t0 + 1192U);
    t7 = *((char **)t1);
    t2 = (4 - 7);
    t3 = (t2 * -1);
    t4 = (1U * t3);
    t5 = (0 + t4);
    t1 = (t7 + t5);
    t6 = *((unsigned char *)t1);
    t13 = (t6 == (unsigned char)3);
    if (t13 != 0)
        goto LAB8;

LAB10:
LAB9:    t1 = (t0 + 4424);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(102, ng0);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t9 = (4 - 7);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t7 = (t8 + t12);
    t13 = *((unsigned char *)t7);
    t14 = (t13 == (unsigned char)2);
    if (t14 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(103, ng0);
    t15 = (t0 + 2152U);
    t16 = *((char **)t15);
    t15 = (t0 + 4696);
    t17 = (t15 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t16, 4U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB6;

LAB8:    xsi_set_current_line(107, ng0);
    t8 = (t0 + 7240);
    t16 = (t0 + 4696);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t8, 4U);
    xsi_driver_first_trans_fast_port(t16);
    goto LAB9;

}


extern void work_a_2323084722_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2323084722_3212880686_p_0,(void *)work_a_2323084722_3212880686_p_1,(void *)work_a_2323084722_3212880686_p_2,(void *)work_a_2323084722_3212880686_p_3};
	xsi_register_didat("work_a_2323084722_3212880686", "isim/DCE_Q816_test_isim_beh.exe.sim/work/a_2323084722_3212880686.didat");
	xsi_register_executes(pe);
}
