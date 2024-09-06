import React from 'react';
import { useQuery } from 'react-query';
import { Link, useParams } from 'react-router-dom';
import { instance } from '../../../apis/util/instance';
/** @jsxImportSource @emotion/react */

function DetailPage(props) {
    const params = useParams();
    const boardId = params.boardId;

    const board = useQuery(
        ["boardQuery", boardId],
        async () => {
            return instance.get(`/board/${boardId}`);
        },
        {
            refetchOnWindowFocus: false,
            retry: 0,
            onSuccess: response => {

            },
            onError: error => {

            }
        }
    );

    return (
        <div>
            <Link to={"/"}><h1>사이트 로고</h1></Link>
            <div>

                <div></div>
            </div>
            <div>

            </div>
        </div>
    );
}

export default DetailPage;