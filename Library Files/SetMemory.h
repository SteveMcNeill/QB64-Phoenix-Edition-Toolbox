#include <algorithm>
#include <cstdint>
#include <cstdio>

inline void SetMemoryByte(uintptr_t dst, uint32_t elements, uint8_t value) {
    std::fill(reinterpret_cast<uint8_t*>(dst),
        reinterpret_cast<uint8_t*>(dst) + elements, value);
}

inline void SetMemoryInteger(uintptr_t dst, uint32_t elements, uint16_t value) {
    std::fill(reinterpret_cast<uint16_t*>(dst),
        reinterpret_cast<uint16_t*>(dst) + elements, value);
}

inline void SetMemoryLong(uintptr_t dst, uint32_t elements, uint32_t value) {
    std::fill(reinterpret_cast<uint32_t*>(dst),
        reinterpret_cast<uint32_t*>(dst) + elements, value);
}