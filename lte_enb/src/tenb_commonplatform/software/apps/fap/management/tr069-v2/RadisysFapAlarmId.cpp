///////////////////////////////////////////////////////////////////////////////
//
// RadisysFapAlarmId.cpp
//
// See header file for documentation.
//
// Copyright radisys Limited
//
///////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////
// Local Includes
///////////////////////////////////////////////////////////////////////////////

#include "platform/RadisysFapAlarmId.h"
namespace threeway
{
    
    const RadisysFapAlarmId::AlarmDescription RadisysFapAlarmId::m_alarmList [ ] = {
                { FapAlarmId::LTE_CONFIGURATION_PLAN_ERROR, RadisysFapAlarmId::LTE_CONFIGURATION_PLAN_ERROR, "Critical Configuration Plan Error",  "", CRITICAL },
                { FapAlarmId::LTE_CONFIGURATION_PLAN_INCONSISTENCY, RadisysFapAlarmId::LTE_CONFIGURATION_PLAN_INCONSISTENCY, "Configuration Plan Inconsistency",  "", MINOR },
		{ FapAlarmId::LTE_FREQUENCY_SYNCHRONISATION_FAILURE, RadisysFapAlarmId::LTE_FREQUENCY_SYNCHRONISATION_FAILURE, "Frequency Synchronization Failure",  "", CRITICAL },
		{ FapAlarmId::LTE_NTP_SERVER_NOT_RESPONDING, RadisysFapAlarmId::LTE_NTP_SERVER_NOT_RESPONDING, "NTP Server Not Responding",  "", MAJOR },
		{ FapAlarmId::LTE_OSCILLATOR_STABILITY_PROBLEM, RadisysFapAlarmId::LTE_OSCILLATOR_STABILITY_PROBLEM, "Oscillator Stability Problem",  "", MAJOR },
		{ FapAlarmId::LTE_FAP_TEMPERATURE_OVER_THRESHOLD, RadisysFapAlarmId::LTE_FAP_TEMPERATURE_OVER_THRESHOLD, "FAP Temperature Above Threshold",  "", MAJOR },
		{ FapAlarmId::PCI_CONFLICT, RadisysFapAlarmId::PCI_CONFLICT, "PCI conflict",  "", WARNING },
		{ FapAlarmId::LTE_LOW_QUALITY_CHANNEL, RadisysFapAlarmId::LTE_LOW_QUALITY_CHANNEL, "Low Quality LTE channel",  "", WARNING },
		{ FapAlarmId::LTE_NETWORK_JITTER, RadisysFapAlarmId::LTE_NETWORK_JITTER, "Network Jitter",  "", MAJOR },
		{ FapAlarmId::S1_SETUP_FAIL, RadisysFapAlarmId::S1_SETUP_FAIL, "S1 Setup failure",  "", MAJOR },
		{ FapAlarmId::X2_SETUP_FAIL, RadisysFapAlarmId::X2_SETUP_FAIL, "X2 Setup failure",  "", MAJOR },
		{ FapAlarmId::LTE_MEMORY_ALLOCATION_FAIL, RadisysFapAlarmId::LTE_MEMORY_ALLOCATION_FAIL, "Memory allocation failure",  "", CRITICAL },
		{ FapAlarmId::SCTP_LINK_FAIL, RadisysFapAlarmId::SCTP_LINK_FAIL, "SCTP link failure",  "", CRITICAL },
		{ FapAlarmId::TNL_SETUP_FAIL, RadisysFapAlarmId::TNL_SETUP_FAIL, "User Plane TNL link failure",  "", WARNING },
		{ FapAlarmId::S1_ERROR_IND, RadisysFapAlarmId::S1_ERROR_IND, "Frequent S1 Error Indications from MME",  "", WARNING },
		{ FapAlarmId::S1_RESET, RadisysFapAlarmId::S1_RESET, "Frequent S1 Resets from MME",  "", MINOR },
		{ FapAlarmId::X2_ERROR_IND, RadisysFapAlarmId::X2_ERROR_IND, "Frequent X2 Error Indications from Neighbour",  "", WARNING },
		{ FapAlarmId::X2_RESET, RadisysFapAlarmId::X2_RESET, "Frequent X2 Resets from Neighbour",  "", MINOR },
		{ FapAlarmId::SOCKET_CFG_FAIL, RadisysFapAlarmId::SOCKET_CFG_FAIL, "Timer expiry for TUCL during static config",  "", CRITICAL },
		{ FapAlarmId::SOCKET_CFG_FAIL, RadisysFapAlarmId::SOCKET_CFG_FAIL, "Config fail for TUCL during static config",  "", MAJOR },
		{ FapAlarmId::SCTP_CFG_FAIL, RadisysFapAlarmId::SCTP_CFG_FAIL, "Timer expiry for SCTP during static config",  "", CRITICAL },
		{ FapAlarmId::SCTP_CFG_FAIL, RadisysFapAlarmId::SCTP_CFG_FAIL, "Config fail for SCTP during static config",  "", MAJOR },
		{ FapAlarmId::S1AP_CFG_FAIL, RadisysFapAlarmId::S1AP_CFG_FAIL, "Timer expiry for S1AP during static config",  "", CRITICAL },
		{ FapAlarmId::S1AP_CFG_FAIL, RadisysFapAlarmId::S1AP_CFG_FAIL, "Config fail for S1AP during static config",  "", MAJOR },
		{ FapAlarmId::EGTP_CFG_FAIL, RadisysFapAlarmId::EGTP_CFG_FAIL, "Timer expiry for EGTP during static config",  "", CRITICAL },
		{ FapAlarmId::EGTP_CFG_FAIL, RadisysFapAlarmId::EGTP_CFG_FAIL, "Config fail for EGTP during static config",  "", MAJOR },
		{ FapAlarmId::X2AP_CFG_FAIL, RadisysFapAlarmId::X2AP_CFG_FAIL, "Timer expiry for X2AP during static config",  "", CRITICAL },
		{ FapAlarmId::X2AP_CFG_FAIL, RadisysFapAlarmId::X2AP_CFG_FAIL, "Config fail for X2AP during static config",  "", MAJOR },
		{ FapAlarmId::RRM_CFG_FAIL, RadisysFapAlarmId::RRM_CFG_FAIL, "Timer expiry for RRM during static config",  "", CRITICAL },
		{ FapAlarmId::RRM_CFG_FAIL, RadisysFapAlarmId::RRM_CFG_FAIL, "Config fail for RRM during static config",  "", MAJOR },
		{ FapAlarmId::APP_CFG_FAIL, RadisysFapAlarmId::APP_CFG_FAIL, "Timer expiry for APP during static config",  "", CRITICAL },
		{ FapAlarmId::APP_CFG_FAIL, RadisysFapAlarmId::APP_CFG_FAIL, "Config fail for APP during static config",  "", MAJOR },
		{ FapAlarmId::RRC_CFG_FAIL, RadisysFapAlarmId::RRC_CFG_FAIL, "Timer expiry for RRC during static config",  "", CRITICAL },
		{ FapAlarmId::RRC_CFG_FAIL, RadisysFapAlarmId::RRC_CFG_FAIL, "Config fail for RRC during static config",  "", MAJOR },
		{ FapAlarmId::PDCPUL_CFG_FAIL, RadisysFapAlarmId::PDCPUL_CFG_FAIL, "Timer expiry for PDCPUL during static config",  "", CRITICAL },
		{ FapAlarmId::PDCPUL_CFG_FAIL, RadisysFapAlarmId::PDCPUL_CFG_FAIL, "Config fail for PDCPUL during static config",  "", MAJOR },
		{ FapAlarmId::PDCPDL_CFG_FAIL, RadisysFapAlarmId::PDCPDL_CFG_FAIL, "Timer expiry for PDCPDL during static config",  "", CRITICAL },
		{ FapAlarmId::PDCPDL_CFG_FAIL, RadisysFapAlarmId::PDCPDL_CFG_FAIL, "Config fail for PDCPDL during static config",  "", MAJOR },
		{ FapAlarmId::RLCUL_CFG_FAIL, RadisysFapAlarmId::RLCUL_CFG_FAIL, "Timer expiry for RLCUL during static config",  "", CRITICAL },
		{ FapAlarmId::RLCUL_CFG_FAIL, RadisysFapAlarmId::RLCUL_CFG_FAIL, "Config fail for RLCUL during static config",  "", MAJOR },
		{ FapAlarmId::RLCDL_CFG_FAIL, RadisysFapAlarmId::RLCDL_CFG_FAIL, "Timer expiry for RLCDL during static config",  "", CRITICAL },
		{ FapAlarmId::RLCDL_CFG_FAIL, RadisysFapAlarmId::RLCDL_CFG_FAIL, "Config fail for RLCDL during static config",  "", MAJOR },
		{ FapAlarmId::MAC_CFG_FAIL, RadisysFapAlarmId::MAC_CFG_FAIL, "Timer expiry for MAC during static config",  "", CRITICAL },
		{ FapAlarmId::MAC_CFG_FAIL, RadisysFapAlarmId::MAC_CFG_FAIL, "Config fail for MAC during static config",  "", MAJOR },
		{ FapAlarmId::CL_CFG_FAIL, RadisysFapAlarmId::CL_CFG_FAIL, "Timer expiry for CL during static config",  "", CRITICAL },
		{ FapAlarmId::CL_CFG_FAIL, RadisysFapAlarmId::CL_CFG_FAIL, "Config fail for CL during static config",  "", MAJOR },
		{ FapAlarmId::CELLUP_CFG_FAIL, RadisysFapAlarmId::CELLUP_CFG_FAIL, "Timer expiry for  CELL during static config",  "", CRITICAL },
		{ FapAlarmId::CELLUP_CFG_FAIL, RadisysFapAlarmId::CELLUP_CFG_FAIL, "Config fail for CELL during static config",  "", MAJOR },
		{ FapAlarmId::ADMIN_STATE_CHANGE_FAIL, RadisysFapAlarmId::ADMIN_STATE_CHANGE_FAIL, "Timer expiry  for Admin state dynamic config",  "", CRITICAL },
		{ FapAlarmId::ADMIN_STATE_CHANGE_FAIL, RadisysFapAlarmId::ADMIN_STATE_CHANGE_FAIL, "Config fail for Admin state dynamic config",  "", MAJOR },
		{ FapAlarmId::GENERIC_PRAMS_CFG_FAIL, RadisysFapAlarmId::GENERIC_PRAMS_CFG_FAIL, "Timer expiry  for Generic params dynamic config",  "", CRITICAL },
		{ FapAlarmId::GENERIC_PRAMS_CFG_FAIL, RadisysFapAlarmId::GENERIC_PRAMS_CFG_FAIL, "Config fail for Generic params dynamic config",  "", MAJOR },
		{ FapAlarmId::MME_IP_PRAMS_CFG_FAIL, RadisysFapAlarmId::MME_IP_PRAMS_CFG_FAIL, "Timer expiry  for MME IP dynamic config",  "", CRITICAL },
		{ FapAlarmId::MME_IP_PRAMS_CFG_FAIL, RadisysFapAlarmId::MME_IP_PRAMS_CFG_FAIL, "Config fail for MME IP dynamic config",  "", MAJOR },
		{ FapAlarmId::CELL_CONFIG_PRAMS_FAIL, RadisysFapAlarmId::CELL_CONFIG_PRAMS_FAIL, "Timer expiry  for cell params dynamic config",  "", CRITICAL },
		{ FapAlarmId::CELL_CONFIG_PRAMS_FAIL, RadisysFapAlarmId::CELL_CONFIG_PRAMS_FAIL, "Config fail for cell params dynamic config",  "", MAJOR },
		{ FapAlarmId::ENBIP_CFG_FAIL, RadisysFapAlarmId::ENBIP_CFG_FAIL, "Timer expiry  for ENBIP dynamic config",  "", CRITICAL },
		{ FapAlarmId::ENBIP_CFG_FAIL, RadisysFapAlarmId::ENBIP_CFG_FAIL, "Config fail for ENBIP dynamic config",  "", MAJOR },
		{ FapAlarmId::MIB_CFG_FAIL, RadisysFapAlarmId::MIB_CFG_FAIL, "Timer expiry  for MIB dynamic config",  "", CRITICAL },
		{ FapAlarmId::MIB_CFG_FAIL, RadisysFapAlarmId::MIB_CFG_FAIL, "Config fail for MIB dynamic config",  "", MAJOR },
		{ FapAlarmId::PRACH_CFG_FAIL, RadisysFapAlarmId::PRACH_CFG_FAIL, "Timer expiry  for PRACH dynamic config",  "", CRITICAL },
		{ FapAlarmId::PRACH_CFG_FAIL, RadisysFapAlarmId::PRACH_CFG_FAIL, "Config fail for PRACH dynamic config",  "", MAJOR },
		{ FapAlarmId::RACH_CFG_FAIL, RadisysFapAlarmId::RACH_CFG_FAIL, "Timer expiry  for RACH dynamic config",  "", CRITICAL },
		{ FapAlarmId::RACH_CFG_FAIL, RadisysFapAlarmId::RACH_CFG_FAIL, "Config fail for RACH dynamic config",  "", MAJOR },
		{ FapAlarmId::PDSCH_CFG_FAIL, RadisysFapAlarmId::PDSCH_CFG_FAIL, "Timer expiry  for PDSCH dynamic config",  "", CRITICAL },
		{ FapAlarmId::PDSCH_CFG_FAIL, RadisysFapAlarmId::PDSCH_CFG_FAIL, "Config fail for PDSCH dynamic config",  "", MAJOR },
		{ FapAlarmId::SRS_CFG_FAIL, RadisysFapAlarmId::SRS_CFG_FAIL, "Timer expiry  for SRS dynamic config",  "", CRITICAL },
		{ FapAlarmId::SRS_CFG_FAIL, RadisysFapAlarmId::SRS_CFG_FAIL, "Config fail for SRS dynamic config",  "", MAJOR },
		{ FapAlarmId::PUSCH_CFG_FAIL, RadisysFapAlarmId::PUSCH_CFG_FAIL, "Timer expiry  for PUSCH dynamic config",  "", CRITICAL },
		{ FapAlarmId::PUSCH_CFG_FAIL, RadisysFapAlarmId::PUSCH_CFG_FAIL, "Config fail for PUSCH dynamic config",  "", MAJOR },
		{ FapAlarmId::ULPOWER_CFG_FAIL, RadisysFapAlarmId::ULPOWER_CFG_FAIL, "Timer expiry  for UL power dynamic config",  "", CRITICAL },
		{ FapAlarmId::ULPOWER_CFG_FAIL, RadisysFapAlarmId::ULPOWER_CFG_FAIL, "Config fail for UL power dynamic config",  "", MAJOR },
		{ FapAlarmId::ULFREQ_CFG_FAIL, RadisysFapAlarmId::ULFREQ_CFG_FAIL, "Timer expiry  for UL freq dynamic config",  "", CRITICAL },
		{ FapAlarmId::ULFREQ_CFG_FAIL, RadisysFapAlarmId::ULFREQ_CFG_FAIL, "Config fail for UL freq dynamic config",  "", MAJOR },
		{ FapAlarmId::PUCCH_CFG_FAIL, RadisysFapAlarmId::PUCCH_CFG_FAIL, "Timer expiry  for PUCCH dynamic config",  "", CRITICAL },
		{ FapAlarmId::PUCCH_CFG_FAIL, RadisysFapAlarmId::PUCCH_CFG_FAIL, "Config fail for PUCCH dynamic config",  "", MAJOR },
		{ FapAlarmId::UETMRCONS_CFG_FAIL, RadisysFapAlarmId::UETMRCONS_CFG_FAIL, "Timer expiry  for UE timer dynamic config",  "", CRITICAL },
		{ FapAlarmId::UETMRCONS_CFG_FAIL, RadisysFapAlarmId::UETMRCONS_CFG_FAIL, "Config fail for UE timer dynamic config",  "", MAJOR },
		{ FapAlarmId::SIB1_CFG_FAIL, RadisysFapAlarmId::SIB1_CFG_FAIL, "Timer expiry  for SIB1 dynamic config",  "", CRITICAL },
		{ FapAlarmId::SIB1_CFG_FAIL, RadisysFapAlarmId::SIB1_CFG_FAIL, "Config fail for SIB1 dynamic config",  "", MAJOR },
		{ FapAlarmId::SIB2_CFG_FAIL, RadisysFapAlarmId::SIB2_CFG_FAIL, "Timer expiry  for SIB2 dynamic config",  "", CRITICAL },
		{ FapAlarmId::SIB2_CFG_FAIL, RadisysFapAlarmId::SIB2_CFG_FAIL, "Config fail for SIB2 dynamic config",  "", MAJOR },
		{ FapAlarmId::SIB3_CFG_FAIL, RadisysFapAlarmId::SIB3_CFG_FAIL, "Timer expiry  for SIB3 dynamic config",  "", CRITICAL },
		{ FapAlarmId::SIB3_CFG_FAIL, RadisysFapAlarmId::SIB3_CFG_FAIL, "Config fail for SIB3 dynamic config",  "", MAJOR },
		{ FapAlarmId::SIB4_CFG_FAIL, RadisysFapAlarmId::SIB4_CFG_FAIL, "Timer expiry  for SIB4 dynamic config",  "", CRITICAL },
		{ FapAlarmId::SIB4_CFG_FAIL, RadisysFapAlarmId::SIB4_CFG_FAIL, "Config fail for SIB4 dynamic config",  "", MAJOR },
		{ FapAlarmId::SIB6_CFG_FAIL, RadisysFapAlarmId::SIB6_CFG_FAIL, "Timer expiry  for SIB6 dynamic config",  "", CRITICAL },
		{ FapAlarmId::SIB6_CFG_FAIL, RadisysFapAlarmId::SIB6_CFG_FAIL, "Config fail for SIB6 dynamic config",  "", MAJOR },
		{ FapAlarmId::SIB9_CFG_FAIL, RadisysFapAlarmId::SIB9_CFG_FAIL, "Timer expiry  for SIB9 dynamic config",  "", CRITICAL },
		{ FapAlarmId::SIB9_CFG_FAIL, RadisysFapAlarmId::SIB9_CFG_FAIL, "Config fail for SIB9 dynamic config",  "", MAJOR },
		{ FapAlarmId::ANR_CFG_FAIL, RadisysFapAlarmId::ANR_CFG_FAIL, "Timer expiry  for ANR dynamic config",  "", CRITICAL },
		{ FapAlarmId::ANR_CFG_FAIL, RadisysFapAlarmId::ANR_CFG_FAIL, "Config fail for ANR dynamic config",  "", MAJOR },
		{ FapAlarmId::MEAS_CFG_FAIL, RadisysFapAlarmId::MEAS_CFG_FAIL, "Timer expiry  for Meas dynamic config",  "", CRITICAL },
		{ FapAlarmId::MEAS_CFG_FAIL, RadisysFapAlarmId::MEAS_CFG_FAIL, "Config fail for Meas dynamic config",  "", MAJOR },
		{ FapAlarmId::EAID_CFG_FAIL, RadisysFapAlarmId::EAID_CFG_FAIL, "Timer expiry  for EAID dynamic config",  "", CRITICAL },
		{ FapAlarmId::EAID_CFG_FAIL, RadisysFapAlarmId::EAID_CFG_FAIL, "Config fail for EAID dynamic config",  "", MAJOR },
		{ FapAlarmId::SIBSCHED_CFG_FAIL, RadisysFapAlarmId::SIBSCHED_CFG_FAIL, "Timer expiry  for SIB sched dynamic config",  "", CRITICAL },
		{ FapAlarmId::SIBSCHED_CFG_FAIL, RadisysFapAlarmId::SIBSCHED_CFG_FAIL, "Config fail for SIB sched dynamic config",  "", MAJOR },
		{ FapAlarmId::RABPOLICY_CFG_FAIL, RadisysFapAlarmId::RABPOLICY_CFG_FAIL, "Timer expiry  for RAB policy dynamic config",  "", CRITICAL },
		{ FapAlarmId::RABPOLICY_CFG_FAIL, RadisysFapAlarmId::RABPOLICY_CFG_FAIL, "Config fail for RAB policy dynamic config",  "", MAJOR },
		{ FapAlarmId::TIMER_CFG_FAIL, RadisysFapAlarmId::TIMER_CFG_FAIL, "Timer expiry  for timer dynamic config",  "", CRITICAL },
		{ FapAlarmId::TIMER_CFG_FAIL, RadisysFapAlarmId::TIMER_CFG_FAIL, "Config fail for timer dynamic config",  "", MAJOR },
		{ FapAlarmId::RRM_CELL_CFG_FAIL, RadisysFapAlarmId::RRM_CELL_CFG_FAIL, "Timer expiry  for RRM cell dynamic config",  "", CRITICAL },
		{ FapAlarmId::RRM_CELL_CFG_FAIL, RadisysFapAlarmId::RRM_CELL_CFG_FAIL, "Config fail for RRM cell dynamic config",  "", MAJOR },
		{ FapAlarmId::ULSCHD_CFG_FAIL, RadisysFapAlarmId::ULSCHD_CFG_FAIL, "Timer expiry  for UL sched dynamic config",  "", CRITICAL },
		{ FapAlarmId::ULSCHD_CFG_FAIL, RadisysFapAlarmId::ULSCHD_CFG_FAIL, "Config fail for UL sched dynamic config",  "", MAJOR },
		{ FapAlarmId::DLSCHD_CFG_FAIL, RadisysFapAlarmId::DLSCHD_CFG_FAIL, "Timer expiry  for DL sched dynamic config",  "", CRITICAL },
		{ FapAlarmId::DLSCHD_CFG_FAIL, RadisysFapAlarmId::DLSCHD_CFG_FAIL, "Config fail for DL sched dynamic config",  "", MAJOR },
		{ FapAlarmId::NEIGH_CFG_FAIL, RadisysFapAlarmId::NEIGH_CFG_FAIL, "Timer expiry  for Neigh dynamic config",  "", CRITICAL },
		{ FapAlarmId::NEIGH_CFG_FAIL, RadisysFapAlarmId::NEIGH_CFG_FAIL, "Config fail for Neigh dynamic config",  "", MAJOR },
		{ FapAlarmId::NEIGH_CELL_CFG_FAIL, RadisysFapAlarmId::NEIGH_CELL_CFG_FAIL, "Timer expiry  for Neigh cell dynamic config",  "", CRITICAL },
		{ FapAlarmId::NEIGH_CELL_CFG_FAIL, RadisysFapAlarmId::NEIGH_CELL_CFG_FAIL, "Config fail for Neigh cell dynamic config",  "", MAJOR },
		{ FapAlarmId::NEIGH_FREQ_CFG_FAIL, RadisysFapAlarmId::NEIGH_FREQ_CFG_FAIL, "Timer expiry  for Neigh freq dynamic config",  "", CRITICAL },
		{ FapAlarmId::NEIGH_FREQ_CFG_FAIL, RadisysFapAlarmId::NEIGH_FREQ_CFG_FAIL, "Config fail for Neigh freq dynamic config",  "", MAJOR },
		{ FapAlarmId::NEIGH_BAND_CLASS_CFG_FAIL, RadisysFapAlarmId::NEIGH_BAND_CLASS_CFG_FAIL, "Timer expiry  for band class dynamic config",  "", CRITICAL },
		{ FapAlarmId::NEIGH_BAND_CLASS_CFG_FAIL, RadisysFapAlarmId::NEIGH_BAND_CLASS_CFG_FAIL, "Config fail for band class dynamic config",  "", MAJOR },
		{ FapAlarmId::ENB_PROTO_CFG_FAIL, RadisysFapAlarmId::ENB_PROTO_CFG_FAIL, "Timer expiry  for ENB proto dynamic config",  "", CRITICAL },
		{ FapAlarmId::ENB_PROTO_CFG_FAIL, RadisysFapAlarmId::ENB_PROTO_CFG_FAIL, "Config fail for ENB proto dynamic config",  "", MAJOR },
		{ FapAlarmId::UTRANEIFREQ_CFG_FAIL, RadisysFapAlarmId::UTRANEIFREQ_CFG_FAIL, "Timer expiry  for UTRA Neigh freq dynamic config",  "", CRITICAL },
		{ FapAlarmId::UTRANEIFREQ_CFG_FAIL, RadisysFapAlarmId::UTRANEIFREQ_CFG_FAIL, "Config fail for UTRA neigh freq dynamic config",  "", MAJOR },
		{ FapAlarmId::EUTRANEIFREQ_CFG_FAIL, RadisysFapAlarmId::EUTRANEIFREQ_CFG_FAIL, "Timer expiry  for EUTRA neigh freq dynamic config",  "", CRITICAL },
		{ FapAlarmId::EUTRANEIFREQ_CFG_FAIL, RadisysFapAlarmId::EUTRANEIFREQ_CFG_FAIL, "Config fail for EUTRA Neigh freq dynamic config",  "", MAJOR },
		{ FapAlarmId::UTRANEICELL_CFG_FAIL, RadisysFapAlarmId::UTRANEICELL_CFG_FAIL, "Timer expiry  for UTRA Neigh cell dynamic config",  "", CRITICAL },
		{ FapAlarmId::UTRANEICELL_CFG_FAIL, RadisysFapAlarmId::UTRANEICELL_CFG_FAIL, "Config fail for UTRA Neigh cell dynamic config",  "", MAJOR },
		{ FapAlarmId::EUTRANEICELL_CFG_FAIL, RadisysFapAlarmId::EUTRANEICELL_CFG_FAIL, "Timer expiry  for EUTRA Neigh cell dynamic config",  "", CRITICAL },
		{ FapAlarmId::EUTRANEICELL_CFG_FAIL, RadisysFapAlarmId::EUTRANEICELL_CFG_FAIL, "Config fail for EUTRA Neigh cell dynamic config",  "", MAJOR },
		{ FapAlarmId::UTRANEILIST_CFG_FAIL, RadisysFapAlarmId::UTRANEILIST_CFG_FAIL, "Timer expiry  for UTRA Neigh list dynamic config",  "", CRITICAL },
		{ FapAlarmId::UTRANEILIST_CFG_FAIL, RadisysFapAlarmId::UTRANEILIST_CFG_FAIL, "Config fail for UTRA Neigh list dynamic config",  "", MAJOR },
		{ FapAlarmId::EUTRANEILIST_CFG_FAIL, RadisysFapAlarmId::EUTRANEILIST_CFG_FAIL, "Timer expiry  for EUTRA Neigh list dynamic config",  "", CRITICAL },
		{ FapAlarmId::EUTRANEILIST_CFG_FAIL, RadisysFapAlarmId::EUTRANEILIST_CFG_FAIL, "Config fail for EUTRA Neigh list dynamic config",  "", MAJOR },
		{ FapAlarmId::RABSRB1_CFG_FAIL, RadisysFapAlarmId::RABSRB1_CFG_FAIL, "Timer expiry  for RAB SRB1 dynamic config",  "", CRITICAL },
		{ FapAlarmId::RABSRB1_CFG_FAIL, RadisysFapAlarmId::RABSRB1_CFG_FAIL, "Config fail for RAB SRB1 dynamic config",  "", MAJOR },
		{ FapAlarmId::RABSRB2_CFG_FAIL, RadisysFapAlarmId::RABSRB2_CFG_FAIL, "Timer expiry  for RAB SRB2 dynamic config",  "", CRITICAL },
		{ FapAlarmId::RABSRB2_CFG_FAIL, RadisysFapAlarmId::RABSRB2_CFG_FAIL, "Config fail for RAB SRB2 dynamic config",  "", MAJOR },
		{ FapAlarmId::EVNT_NEIGH_ENB_CFG_FAIL, RadisysFapAlarmId::EVNT_NEIGH_ENB_CFG_FAIL, "Timer expiry  for Neigh ENB dynamic config",  "", CRITICAL },
		{ FapAlarmId::EVNT_NEIGH_ENB_CFG_FAIL, RadisysFapAlarmId::EVNT_NEIGH_ENB_CFG_FAIL, "Config fail for Neigh ENB dynamic config",  "", MAJOR },
		{ FapAlarmId::SMCELL_CFG_FAIL, RadisysFapAlarmId::SMCELL_CFG_FAIL, "Timer expiry  for SM Cell dynamic config",  "", CRITICAL },
		{ FapAlarmId::SMCELL_CFG_FAIL, RadisysFapAlarmId::SMCELL_CFG_FAIL, "Config fail for SM cell dynamic config",  "", MAJOR },
		{ FapAlarmId::PROCTMR_CFG_FAIL, RadisysFapAlarmId::PROCTMR_CFG_FAIL, "Timer expiry  for Proc Timer dynamic config",  "", CRITICAL },
		{ FapAlarmId::PROCTMR_CFG_FAIL, RadisysFapAlarmId::PROCTMR_CFG_FAIL, "Config fail for Proc Timer dynamic config",  "", MAJOR },
		{ FapAlarmId::CFG_FAIL_FROM_SON, RadisysFapAlarmId::CFG_FAIL_FROM_SON, "Serving Cell Configuration Failure Alert from SON",  "", MAJOR },
		{ FapAlarmId::PCI_COLLISION, RadisysFapAlarmId::PCI_COLLISION, "PCI Collision Detected at SON",  "", CRITICAL },
		{ FapAlarmId::PCI_CONFUSION, RadisysFapAlarmId::PCI_CONFUSION, "PCI Confusion Detected at SON",  "", CRITICAL },


  };

};
