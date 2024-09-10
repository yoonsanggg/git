import random
from dataclasses import dataclass
from typing import List, Dict, Callable, Optional

@dataclass
class Prize:
    name: str
    count: int
    description: Optional[str] = None

def get_participants(min_participants: int, input_func: Callable = input, output_func: Callable = print) -> int:
    """참여자 수를 입력받고 유효성을 검사하여 반환."""
    while True:
        try:
            num = int(input_func(f"몇 명이 참여하나요? (최소 {min_participants}명): "))
            if num >= min_participants:
                return num
            output_func(f"인원수가 적습니다. 최소 {min_participants}명 이상이어야 합니다.")
        except ValueError:
            output_func("잘못된 입력입니다. 숫자를 입력해주세요.")

def select_winners(participants: List[int], prizes: List[Prize], seed: Optional[int] = None) -> Dict[str, List[int]]:
    """무작위로 당첨자를 선택하여 반환."""
    if seed is not None:
        random.seed(seed)
    selected = random.sample(participants, sum(prize.count for prize in prizes))

    # 수정된 부분
    result = {}
    index = 0
    for prize in prizes:
        result[prize.name] = selected[index:index + prize.count]
        index += prize.count
    return result

def display_winners(winners: Dict[str, List[int]], prizes: List[Prize], output_func: Callable = print) -> None:
    """당첨자를 출력."""
    for prize in prizes:
        winners_list = winners[prize.name]
        description = f" ({prize.description})" if prize.description else ""
        output_func(f"{prize.name}{description}: {', '.join(map(str, winners_list))} (총 {len(winners_list)}명)")

def event(prizes: List[Prize], seed: Optional[int] = None, input_func: Callable = input, output_func: Callable = print) -> None:
    """이벤트 실행."""
    num = get_participants(sum(prize.count for prize in prizes), input_func, output_func)
    participants = list(range(1, num + 1))
    winners = select_winners(participants, prizes, seed)
    display_winners(winners, prizes, output_func)

if __name__ == "__main__":
    default_prizes = [
        Prize("1등 냉장고", 1, description="LG 시그니처"),
        Prize("2등 세탁기", 2, description="LG 시그니처"),
        Prize("3등 인덕션", 3, description="MELEE"),
        Prize("4등 커피머신", 4, description="Ferrie")
    ]
    event(default_prizes)
