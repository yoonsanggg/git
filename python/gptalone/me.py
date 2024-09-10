import random
from dataclasses import dataclass
from typing import List, Dict, Callable, Optional

@dataclass
# 상품 정보 저장
class Prize:
    name: str
    count: int
    # 상품에 대한 설명을 나타내는 옵션 필드
    # 옵션 필드: 값 있을 수도 있고 없을 수도 있어~
    description: Optional[str] = None
