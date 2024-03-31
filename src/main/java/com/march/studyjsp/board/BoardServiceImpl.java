package com.march.studyjsp.board;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
    private final BoardMapper boardMapper;

    //작성
//    @Override
//    public BoardDTO boardInsert(BoardDTO boardDTO) {
//        boardMapper.boardInsert(boardDTO);
//        return boardDTO;
//    }

    @Override
    public void boardInsert(BoardDTO boardDTO) {
        boardMapper.boardInsert(boardDTO);
    }

    //글목록
    @Override
    public List<BoardDTO> boardList() {
        return boardMapper.boardList();
    }

    //상세페이지
    @Override
    public BoardDTO boardDetail(Long id) {
        return boardMapper.boardDetail(id);
    }

    //수정
    @Override
    public void boardUpdate(BoardDTO boardDTO) {
        boardMapper.boardUpdate(boardDTO);
    }

    //삭제
    @Override
    public void boardDelete(Long id) {
        boardMapper.boardDelete(id);
    }
}
