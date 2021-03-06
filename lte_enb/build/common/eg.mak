
include ../common/rsys_fancy.mak
include ../common/env.mak

COLOR=$(COLOR_GREEN)

SRC_DIR=$(ROOT_DIR)/src/egtpu

# Prepare the list of source files to be compiled
C_SRCS=$(wildcard $(SRC_DIR)/*.c)
C_SRCS:=$(filter-out %intel.c, $(C_SRCS))
C_SRCS:=$(filter-out %brcm.c, $(C_SRCS))
C_SRCS:=$(filter-out %eg_tst.c, $(C_SRCS))
C_SRCS:=$(filter-out %socklayer.c, $(C_SRCS))
C_SRCS_WO_PEDANTIC = $(SRC_DIR)/eg_socklayer.c

#prepare the list of object files and RLOG related files
C_OBJS=$(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(C_SRCS))
LOG_FILES=$(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.i,$(C_SRCS))
DB_FILES =$(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.i.db,$(C_SRCS))
C_WO_PED_OBJS=$(OBJ_DIR)/eg_socklayer.o
LOG_FILES+= $(OBJ_DIR)/eg_socklayer.i
DB_FILES += $(OBJ_DIR)/eg_socklayer.i.db

# prepare the list of common header files
HDR_FILES+=$(wildcard $(CM_DIR)/env*.[hx])
HDR_FILES+=$(wildcard $(CM_DIR)/gen*.[hx])
HDR_FILES+=$(wildcard $(CM_DIR)/ssi*.[hx])
HDR_FILES+=$(wildcard $(CM_DIR)/cm*.[hx])
HDR_FILES+=$(wildcard $(CM_DIR)/nhu*.[hx])
HDR_FILES+=$(wildcard $(CM_DIR)/lnh*.[hx])
HDR_FILES+=$(wildcard $(CM_DIR)/crl.[hx])
HDR_FILES+=$(wildcard $(CM_DIR)/crg.[hx])
HDR_FILES+=$(wildcard $(CM_DIR)/cpj.[hx])

# TODO - This should not be needed. Try to eliminate
I_OPTS+=-I$(ROOT_DIR)/src/enbapp/src

#-------------------------------------------------------------#
#Makefile for product EG - script generated.
#-------------------------------------------------------------#

#-------------------------------------------------------------#
#User macros (to be modified)
#-------------------------------------------------------------#

MOD_FLAGS=-DEG -DEGTP_U

#-------------------------------------------------------------#
#File/Obj macros             
#-------------------------------------------------------------#

#egSRCS= \
#        $(IN_DIR)/eg_cpm.$(SRC) \
#        $(IN_DIR)/eg_edm.$(SRC) \
#        $(IN_DIR)/eg_ex_ms.$(SRC) \
#        $(IN_DIR)/eg_id.$(SRC) \
#        $(IN_DIR)/eg_tunn.$(SRC) \
#        $(IN_DIR)/eg_li.$(SRC) \
#        $(IN_DIR)/eg_ui.$(SRC) \
#        $(IN_DIR)/eg_tpt.$(SRC) \
#        $(IN_DIR)/eg_mi.$(SRC) \
#        $(IN_DIR)/eg_tmr.$(SRC) \
#        $(IN_DIR)/eg_ptli.$(SRC) \
#        $(IN_DIR)/eg_ptmi.$(SRC) \
#        $(IN_DIR)/eg_util.$(SRC) \
#        $(IN_DIR)/eg_ptui.$(SRC) \
#		$(IN_DIR)/eg_socklayer.$(SRC)

#egOBJS= \
#	$(OUT_DIR)/eg_cpm.$(OBJ) \
#	$(OUT_DIR)/eg_edm.$(OBJ) \
#	$(OUT_DIR)/eg_ex_ms.$(OBJ) \
#	$(OUT_DIR)/eg_id.$(OBJ) \
#	$(OUT_DIR)/eg_tunn.$(OBJ) \
#	$(OUT_DIR)/eg_li.$(OBJ) \
#	$(OUT_DIR)/eg_ui.$(OBJ) \
#	$(OUT_DIR)/eg_tpt.$(OBJ) \
#	$(OUT_DIR)/eg_mi.$(OBJ) \
#	$(OUT_DIR)/eg_tmr.$(OBJ) \
#	$(OUT_DIR)/eg_ptli.$(OBJ) \
#	$(OUT_DIR)/eg_ptmi.$(OBJ) \
#	$(OUT_DIR)/eg_util.$(OBJ) \
	$(OUT_DIR)/eg_ptui.$(OBJ) \
#	$(OUT_DIR)/eg_socklayer.$(OBJ) 
	
#EGCM_INC= \
#    $(VS_DIR)/eg.h $(VS_DIR)/eg.x $(VS_DIR)/eg_util.h $(VS_DIR)/eg_util.x

#ALL_INC=$(EGCM_INC) $(CM_INC)
   
#-------------------------------------------------------------#
#-------------------------------------------------------------#
#Compiler macros             
#-------------------------------------------------------------#

#$(OUT_DIR)/eg_cpm.$(OBJ): $(IN_DIR)/eg_cpm.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_cpm.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_cpm.$(SRC)
#$(OUT_DIR)/eg_edm.$(OBJ): $(IN_DIR)/eg_edm.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_edm.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_edm.$(SRC)
#$(OUT_DIR)/eg_ex_ms.$(OBJ): $(IN_DIR)/eg_ex_ms.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_ex_ms.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_ex_ms.$(SRC)
#$(OUT_DIR)/eg_id.$(OBJ): $(IN_DIR)/eg_id.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_id.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_id.$(SRC)
#$(OUT_DIR)/eg_tunn.$(OBJ): $(IN_DIR)/eg_tunn.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_tunn.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_tunn.$(SRC)
#$(OUT_DIR)/eg_li.$(OBJ): $(IN_DIR)/eg_li.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_li.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_li.$(SRC)
#$(OUT_DIR)/eg_ui.$(OBJ): $(IN_DIR)/eg_ui.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_ui.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_ui.$(SRC)
#$(OUT_DIR)/eg_tpt.$(OBJ): $(IN_DIR)/eg_tpt.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_tpt.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_tpt.$(SRC)
#$(OUT_DIR)/eg_mi.$(OBJ): $(IN_DIR)/eg_mi.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_mi.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_mi.$(SRC)
#$(OUT_DIR)/eg_tmr.$(OBJ): $(IN_DIR)/eg_tmr.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_tmr.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_tmr.$(SRC)
#$(OUT_DIR)/eg_ptli.$(OBJ): $(IN_DIR)/eg_ptli.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_ptli.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_ptli.$(SRC)
#$(OUT_DIR)/eg_ptmi.$(OBJ): $(IN_DIR)/eg_ptmi.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_ptmi.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_ptmi.$(SRC)
#$(OUT_DIR)/eg_util.$(OBJ): $(IN_DIR)/eg_util.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_util.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_util.$(SRC)
#$(OUT_DIR)/eg_ptui.$(OBJ): $(IN_DIR)/eg_ptui.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_ptui.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_ptui.$(SRC)
#	
#$(OUT_DIR)/eg_socklayer.$(OBJ): $(IN_DIR)/eg_socklayer.$(SRC) $(ALL_INC)
#	$(CC)  -o$(OUT_DIR)/eg_socklayer.$(OBJ) $(COPTS) $(IOPTS) $(POPTS) $(CCegFLAGS) \
#	$(IN_DIR)/eg_socklayer.$(SRC)

lib: $(LIB_DIR)/libeg.a

include $(COM_BUILD_DIR)/compile.mak

#-------------------------------------------------------------#
#Linker macros             
#-------------------------------------------------------------#
ifeq ($(BIN_LOG), YES)
$(LIB_DIR)/libeg.a:$(C_OBJS) $(C_WO_PED_OBJS)
	@echo -e "Creating log DB $(COLOR)$(LOG_DIR)/egLog.db $(REVERT_COLOR)"
	$(Q)cat $(DB_FILES) > $(LOG_DIR)/egLog.db
	@echo -e "Creating Archive $(COLOR) $@ $(REVERT_COLOR)"
	$(Q)ar -cr $@ $(C_OBJS) $(C_WO_PED_OBJS)
else
$(LIB_DIR)/libeg.a:$(C_OBJS) $(C_WO_PED_OBJS)
	@echo -e "Creating Archive $(COLOR) $@ $(REVERT_COLOR)"
	$(Q)ar -cr $@ $(C_OBJS) $(C_WO_PED_OBJS)
endif

#-------------------------------------------------------------#
#Clean macros             
#-------------------------------------------------------------#
clean:
	@echo -e "$(COLOR_RED)Cleaning EGTP$(REVERT_COLOR)"
	$(Q)\rm -f $(LIB_DIR)/libeg.a $(C_OBJS) $(C_WO_PED_OBJS)

