#
# This policy configuration will be used by all products that
# inherit from SSHD
#

BOARD_SEPOLICY_DIRS += \
    vendor/sshd/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    mac_permissions.xml
