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
static const char *ng0 = "E:/ProcesadorUno/arq_ALU/ALU.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t26[16];
    char t41[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned char t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 4740);
    t4 = xsi_mem_cmp(t1, t2, 6U);
    if (t4 == 1)
        goto LAB3;

LAB12:    t5 = (t0 + 4746);
    t7 = xsi_mem_cmp(t5, t2, 6U);
    if (t7 == 1)
        goto LAB4;

LAB13:    t8 = (t0 + 4752);
    t10 = xsi_mem_cmp(t8, t2, 6U);
    if (t10 == 1)
        goto LAB5;

LAB14:    t11 = (t0 + 4758);
    t13 = xsi_mem_cmp(t11, t2, 6U);
    if (t13 == 1)
        goto LAB6;

LAB15:    t14 = (t0 + 4764);
    t16 = xsi_mem_cmp(t14, t2, 6U);
    if (t16 == 1)
        goto LAB7;

LAB16:    t17 = (t0 + 4770);
    t19 = xsi_mem_cmp(t17, t2, 6U);
    if (t19 == 1)
        goto LAB8;

LAB17:    t20 = (t0 + 4776);
    t22 = xsi_mem_cmp(t20, t2, 6U);
    if (t22 == 1)
        goto LAB9;

LAB18:    t23 = (t0 + 4782);
    t25 = xsi_mem_cmp(t23, t2, 6U);
    if (t25 == 1)
        goto LAB10;

LAB19:
LAB11:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 4788);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 5U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(26, ng0);
    t27 = (t0 + 1192U);
    t28 = *((char **)t27);
    t27 = (t0 + 4668U);
    t29 = (t0 + 1352U);
    t30 = *((char **)t29);
    t29 = (t0 + 4684U);
    t31 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t26, t28, t27, t30, t29);
    t32 = (t26 + 12U);
    t33 = *((unsigned int *)t32);
    t34 = (1U * t33);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB21;

LAB22:    t36 = (t0 + 3072);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t31, 5U);
    xsi_driver_first_trans_fast_port(t36);
    goto LAB2;

LAB4:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4668U);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t3 = (t0 + 4684U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB23;

LAB24:    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 5U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB5:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4668U);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t3 = (t0 + 4684U);
    t6 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB25;

LAB26:    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 5U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB6:    xsi_set_current_line(32, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4668U);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t3 = (t0 + 4684U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB27;

LAB28:    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 5U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB7:    xsi_set_current_line(34, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4668U);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t3 = (t0 + 4684U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t41, t2, t1, t5, t3);
    t8 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t26, t6, t41);
    t9 = (t26 + 12U);
    t33 = *((unsigned int *)t9);
    t34 = (1U * t33);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB29;

LAB30:    t11 = (t0 + 3072);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    memcpy(t17, t8, 5U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB2;

LAB8:    xsi_set_current_line(36, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4668U);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t3 = (t0 + 4684U);
    t6 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t26, t2, t1, t5, t3);
    t8 = (t26 + 12U);
    t33 = *((unsigned int *)t8);
    t34 = (1U * t33);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB31;

LAB32:    t9 = (t0 + 3072);
    t11 = (t9 + 56U);
    t12 = *((char **)t11);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t6, 5U);
    xsi_driver_first_trans_fast_port(t9);
    goto LAB2;

LAB9:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4668U);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t3 = (t0 + 4684U);
    t6 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t41, t2, t1, t5, t3);
    t8 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t26, t6, t41);
    t9 = (t26 + 12U);
    t33 = *((unsigned int *)t9);
    t34 = (1U * t33);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB33;

LAB34:    t11 = (t0 + 3072);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    memcpy(t17, t8, 5U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB2;

LAB10:    xsi_set_current_line(40, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 4668U);
    t3 = (t0 + 1352U);
    t5 = *((char **)t3);
    t3 = (t0 + 4684U);
    t6 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t41, t2, t1, t5, t3);
    t8 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t26, t6, t41);
    t9 = (t26 + 12U);
    t33 = *((unsigned int *)t9);
    t34 = (1U * t33);
    t35 = (5U != t34);
    if (t35 == 1)
        goto LAB35;

LAB36:    t11 = (t0 + 3072);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    t15 = (t14 + 56U);
    t17 = *((char **)t15);
    memcpy(t17, t8, 5U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB2;

LAB20:;
LAB21:    xsi_size_not_matching(5U, t34, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(5U, t34, 0);
    goto LAB24;

LAB25:    xsi_size_not_matching(5U, t34, 0);
    goto LAB26;

LAB27:    xsi_size_not_matching(5U, t34, 0);
    goto LAB28;

LAB29:    xsi_size_not_matching(5U, t34, 0);
    goto LAB30;

LAB31:    xsi_size_not_matching(5U, t34, 0);
    goto LAB32;

LAB33:    xsi_size_not_matching(5U, t34, 0);
    goto LAB34;

LAB35:    xsi_size_not_matching(5U, t34, 0);
    goto LAB36;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/tb_ALU_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
